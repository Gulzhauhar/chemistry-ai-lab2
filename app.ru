from CAOS.dispatch import react
from CAOS.structures.molecule import Molecule

# Определяем молекулы
acid = Molecule(
    {'a1': 'H', 'a2': 'H', 'a3': 'H', 'a4': 'O'},
    {'b1': {'nodes': ('a1', 'a4'), 'order': 1},
     'b2': {'nodes': ('a2', 'a4'), 'order': 1},
     'b3': {'nodes': ('a3', 'a4'), 'order': 1}},
    id='Hydronium'
)

base = Molecule(
    {'a1': 'H', 'a2': 'O'},
    {'b1': {'nodes': ('a1', 'a2'), 'order': 1}},
    id='Hydroxide'
)

# Реакция
products = react(acid, base)
print(products)
pip install retrochem
from retrochem import RetroChem

model = RetroChem()
result = model.predict("CCO")  
print(result)
reaction_dict = {
    "2H2 + O2 = 2H2O": {"temp": 570},
    "H2 + Cl2 = 2HCl": {}
}

def check_reaction(molecules):
    for equation, data in reaction_dict.items():
        reactants, products = equation.split("=")
pip install chemics
import chemics as cm

eq = cm.ChemicalEquation('2 H2 + O2 -> 2 H2O')
print(eq.balance)
