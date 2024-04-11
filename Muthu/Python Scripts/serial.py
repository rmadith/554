import serial
import sys

def send_file_over_uart(filename, port="COM4", baudrate=9600):
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
        with open(filename, "rb") as f:
            file_data = f.read()

        # Open the serial port
        ser = serial.Serial(port, baudrate)

        # Send the file data
        ser.write(file_data)

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