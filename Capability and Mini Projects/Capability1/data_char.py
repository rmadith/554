chars = [0,1,2,3,4,5,6,7,8,9,"A","B","C","D","E","F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "=", ">", "(", ")"]

count = 6

for i, char in enumerate(chars):
    # Assuming add_fnt, add_img, rem_img are flags and fnt_indx, image_index are indexes
    # The following is a placeholder. You will need to adjust the logic to set these variables correctly
    add_fnt = 1
    fnt_indx = i if i < 64 else 0  # Just an example, ensure i fits in 6 bits
    add_img = 0
    rem_img = 0
    image_index = 0  # Example, ensure i fits in 5 bits
    
    # Construct the byte
    byte = (add_fnt << 15) | (fnt_indx << 9) | (00 << 7) | (add_img << 6) | (rem_img << 5) | (image_index)
    
    # Convert to hex, stripping the '0x' prefix and padding to 4 characters
    hex_str = f'{byte:04x}'.upper()
    
    line = f'@{hex(count)[2:]:0>4} {hex_str}'

    # Add " // " and the character
    line += f' // {char}'

    print(line)
    
    count += 1  # Assuming count increments for each char

    
