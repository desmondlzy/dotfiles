"""
ffmpeg -i input.mp4 \
    -vf "fps=10,scale=320:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" \
    -loop 0 output.gif
"""
import os
import argparse 

def video2gif(input_file, output_file, fps=10, scale=320, loop=0):
    cmd = f'ffmpeg -i {input_file} -vf "fps={fps},scale={scale}:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop {loop} {output_file}'
    os.system(cmd)

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Convert video to gif')
    parser.add_argument('input', help='input video file')
    parser.add_argument('output', help='output gif file', default=None)
    parser.add_argument('--fps', help='frame per second', default=10)
    parser.add_argument('--scale', help='scale', default=320)
    parser.add_argument('--loop', help='loop', choices=[0, 1], default=0)

    args = parser.parse_args()
    output = args.output if args.output else os.path.splitext(args.input)[0] + '.gif'

    video2gif(args.input, output, args.fps, args.scale, args.loop)
