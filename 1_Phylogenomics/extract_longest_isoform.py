### This script was written by Lewis Stevens ls30@sanger.ac.uk ###
import sys

with open(sys.argv[1], 'r') as fasta:
        fasta_dict  = {}
        for line in fasta:
                if line.startswith(">"):
                        header = line.rstrip("\n")
                        fasta_dict[header] = ''
                else:
                        fasta_dict[header] += line.rstrip("\n")

longest_fasta_dict = {}

for header,seq in fasta_dict.items():
        gene = "_".join(header.split(" ")[0].split("_")[0:4])
        length = int(header.split(" ")[1].split("=")[1])
        try:
                if length > longest_fasta_dict[gene][0]:
                        longest_fasta_dict[gene] = [length, seq]
        except KeyError:
                longest_fasta_dict[gene] = [length, seq]

for header, list in longest_fasta_dict.items():
        print(header)
        print(list[1])
