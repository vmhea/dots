import pyperclip

report_path = "/home/heath/Documents/daily_report.md"
report_list = []

with open(report_path,'r') as report_file:
    report_lines = report_file.readlines()[4:]      # read file, skip first two lines
    for line in report_lines:                       # line read loop
        if line.startswith('###'):                  # break loop if line starts with ###
            break
        report_list.append(line)                    # append each line to list
    report_file.close()

report_trimmed = report_list[:len(report_list)-2]   # remove the last 2 line breaks
report_string = ''.join(report_trimmed)             # convert list to str
report = report_string[:-1]                         # remove last linebreak character

pyperclip.copy(report)
#pyperclip.paste(report)
