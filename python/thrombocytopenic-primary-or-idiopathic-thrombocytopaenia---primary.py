# Kuan V, Denaxas S, Gonzalez-Izquierdo A, Direk K, Bhatti O, Husain S, Sutaria S, Hingorani M, Nitsch D, Parisinos C, Lumbers T, Mathur R, Sofat R, Casas JP, Wong I, Hemingway H, Hingorani A, 2024.

import sys, csv, re

codes = [{"code":"D313.12","system":"readv2"},{"code":"D313012","system":"readv2"},{"code":"D313.00","system":"readv2"},{"code":"D313100","system":"readv2"},{"code":"D313111","system":"readv2"},{"code":"D313.15","system":"readv2"},{"code":"42P2.11","system":"readv2"},{"code":"D313000","system":"readv2"},{"code":"D313z00","system":"readv2"},{"code":"71257.0","system":"readv2"},{"code":"65723.0","system":"readv2"},{"code":"45698.0","system":"readv2"},{"code":"46754.0","system":"readv2"},{"code":"877.0","system":"readv2"},{"code":"38754.0","system":"readv2"},{"code":"57456.0","system":"readv2"},{"code":"21604.0","system":"readv2"},{"code":"16420.0","system":"readv2"},{"code":"5144.0","system":"readv2"},{"code":"5181.0","system":"readv2"},{"code":"62795.0","system":"readv2"},{"code":"55582.0","system":"readv2"},{"code":"22463.0","system":"readv2"},{"code":"58906.0","system":"readv2"},{"code":"12234.0","system":"readv2"},{"code":"54005.0","system":"readv2"},{"code":"D69.3","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('primary-or-idiopathic-thrombocytopaenia-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["thrombocytopenic-primary-or-idiopathic-thrombocytopaenia---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["thrombocytopenic-primary-or-idiopathic-thrombocytopaenia---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["thrombocytopenic-primary-or-idiopathic-thrombocytopaenia---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
