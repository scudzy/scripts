import click
from pathlib import Path
from subprocess import call, check_output
from tqdm import tqdm

@click.command()
@click.argument('directory', type=click.Path(exists=True))
@click.option('--recursive', is_flag=True, help='Recursive')
@click.option('--file-ext', help='File format to process')
def main(directory, file_ext='ts', recursive=False):
    """ Compress h264 video files in a directory using libx265 codec with crf=28
    Args:
         directory: the directory to scan for video files
         file_ext: the file extension to consider for conversion
         recursive: whether to search directory or all its contents
    """

    if recursive:
        video_files = [fp.absolute() for fp in Path(directory).rglob(f'*.{file_ext}')]
    else:
        video_files = [fp.absolute() for fp in Path(directory).glob(f'*.{file_ext}')]

    check_codec_cmd = 'ffprobe -v error -select_streams v:0 -show_entries stream=codec_name -of default=noprint_wrappers=1:nokey=1 "{fp}"'
    codecs = []
    for fp in tqdm(video_files, desc='Checking metadata', unit='videos'):
        codecs.append(check_output(check_codec_cmd.format(fp=fp), shell=True).strip().decode('UTF-8'))

    files_to_process = [fp for fp, codec in zip(video_files, codecs) if codec != 'hevc']

    print(f'\nTOTAL FILES FOUND ({len(video_files)})')
    print(f'FILES TO PROCESS ({len(files_to_process)}):', [fp.name for fp in files_to_process], '\n')

    if len(files_to_process) == 0:
        raise click.Abort
    else:
        click.confirm('Do you want to continue?', abort=True)

    for fp in tqdm(files_to_process, desc='Converting files', unit='videos'):
        new_fp = fp.parent / f'temp_ffmpeg.mp4'
        convert_cmd = f'ffmpeg -i "{fp}" -c copy "{new_fp}"'
        conversion_return_code = call(convert_cmd, shell=True)
        if conversion_return_code == 0:
            call(f'touch -r "{fp}" "{new_fp}"', shell=True)
            call(f'mv "{new_fp}" "{fp}"', shell=True)


if __name__ == '__main__':
    main()