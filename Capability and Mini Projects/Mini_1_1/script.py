import sys 


def getASMText(text):
    output = ""
    totalChars = 0

    for c in text:
        # Generate memory address for start of line
        # @xxxx where xxxx is hex address in lowercase
        # hex(totalChars) gets hex representation
        # [2:] removes the 0x at start of returned hex string
        # zero fill left pads with 0 until 4 characters
        line = f'@{(hex(totalChars)[2:]):0>4} '

        # Add current character
        line += f'{(hex(ord(c))[2:]):0>4}  '

        # Comment for line and carriage return
        line += f'// {c}\n'

        output += line
        totalChars += 1

    return output




if __name__ == "__main__":
    if len(sys.argv) != 2:
        print('Must supply 1 text argument to translate')
        sys.exit(1)

    outputString = getASMText(sys.argv[1])

    print(outputString)

    
