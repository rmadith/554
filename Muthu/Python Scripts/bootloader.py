import serial
import sys
import threading

def read_from_uart(ser):
    """
    Continuously reads from the UART port and prints the data.

    Args:
        ser (serial.Serial): The open serial port.
    """
    try:
        while True:
            if ser.in_waiting > 0:
                data = ser.readline()
                print(f"Received: {data.decode().strip()}")
    except serial.SerialException as e:
        print(f"Error reading from UART: {e}")

def send_file_over_uart(filename, port="/dev/tty.usbserial-FT0DJN8X", baudrate=115200):
    """
    Sends a file over the specified UART port.

    Args:
        filename (str): The path to the file to send.
        port (str, optional): The COM port to use. Defaults to "COM4".
        baudrate (int, optional): The baud rate of the UART communication.
            Defaults to 9600.

    Raises:
        FileNotFoundError: If the specified file cannot be found.
        SerialException: If there's an error opening or communicating with the serial port.
    """

    try:
        # Open the file in binary read mode
        ser = serial.Serial(port, baudrate)

        # Start the reading thread
        read_thread = threading.Thread(target=read_from_uart, args=(ser,))
        read_thread.daemon = True
        read_thread.start()

        with open(filename, "r") as f:
            for line in f:
                # Convert the hex line to binary
                binary_data = bytes.fromhex(line.strip())
                print(f"Sent: {binary_data}")
                # Send the binary data
                ser.write(binary_data)

        read_thread.join()


        print(f"Successfully sent file: {filename}")

    except FileNotFoundError as e:
        print(f"Error: File not found: {filename}")
    except serial.SerialException as e:
        print(f"Error: Serial communication error: {e}")
    finally:
        # Close the serial port (if opened)
        if ser:
            ser.close()

if __name__ == "__main__":
    # Check if there's at least one argument (filename)
    if len(sys.argv) < 2:
        print("Usage: python send_file_uart.py <filename>")
        exit(1)

    # Get the filename from the first argument
    filename = sys.argv[1]

    # Send the file
    send_file_over_uart(filename)

