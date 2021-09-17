import sys
sys.path.append('/programs/gems')
import gmml
 
# Optional: add usage information for folks who need it
if sys.argv[1] in ('--help', '-h', 'help'):
        print("""
Usage:
        python3 simple.py input.pdb
 
        Where "input.pdb" is a PDB file.
""")
        sys.exit()
 
# Optional:  assign the filename in argv[1] to the variable "pdb"
pdb = sys.argv[1]
 
# Load the file with name pdb into an instance of a pdb file structure
pdbfile = gmml.PdbFile(pdb)
 
# Set an object to hold header information
header = pdbfile.GetHeader()
 
# Print out the deposition date for the file
print("The deposition date is:", header.GetDepositionDate())
