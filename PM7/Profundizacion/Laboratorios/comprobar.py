"""Ejecuta expectativas independientes; las variantes defectuosas deben fallar."""
import argparse
import unittest
from politica import AVISOS, seleccionar

parser = argparse.ArgumentParser()
parser.add_argument("--variante", choices=["correcta", "or", "limite", "identidad"], default="correcta")
args = parser.parse_args()


class Contrato(unittest.TestCase):
    def ids(self, minimo=3, ocultar=True):
        return [a.id for a in seleccionar(AVISOS, minimo, ocultar, args.variante)]

    def test_regla_combinada(self):
        self.assertEqual(self.ids(), ["T-A", "T-D"])

    def test_limite_inclusivo(self):
        self.assertEqual(self.ids(4, False), ["T-C"])

    def test_lectura_es_independiente(self):
        self.assertEqual(self.ids(1), ["T-A", "T-B", "T-D"])

    def test_identidades_distintas(self):
        self.assertEqual(self.ids(3, False), ["T-A", "T-C", "T-D"])

    def test_fuente_conservada(self):
        antes = tuple(AVISOS)
        self.ids()
        self.assertEqual(tuple(AVISOS), antes)

    def test_prioridad_invalida(self):
        with self.assertRaises(ValueError):
            seleccionar(AVISOS, 0, True, args.variante)


if __name__ == "__main__":
    unittest.main(argv=["comprobar.py"], verbosity=2)
