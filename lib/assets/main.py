import sys
from cvxopt.modeling import variable, op

def main():
    initial_products = [["Auzu putraimi", 13, 6.5, 61.1, 380, 0.92], ["Griķu putraimi", 12.5, 2.5, 67.4, 254, 1.85], ["Grūbas", 8.9, 1.2, 72.4, 345, 2.26]]
    wanted_products = [["Gaļa", 25, 8, 75, 440, 3.00]]
    unwanted_products = []
    limits = [96, 90, 383, 2400]

    initial_products += wanted_products
    initial_products = [i for i in initial_products if i[0] not in unwanted_products]

    products = [[initial_products[j][i] for j in range(len(initial_products))] for i in range(len(initial_products[0]))]
    x = variable(len(initial_products), "x")

    cost_function = 0
    for i in range(len(x)):
        cost_function += products[len(products) - 1][i] * x[i]

    constraints = [x[i] >= 5 for i in range(len(x))]
    for i in range(len(limits)):
        _summa = 0
        for j in range(len(x)):
            _summa += products[i + 1][j] * x[j]
        constraints.append(-1 * _summa <= -1 * limits[i])
    constraints.append(x >= 0)

    problem = op(cost_function, constraints)
    problem.solve()

    if problem.status == "optimal":
        print("Rezultāts:")
        _summa = 0
        for i in range(len(x)):
            _cost = x.value[i] * products[len(products) - 1][i]
            _summa += _cost
            print("{:.2f} kg of {}, izmaksas: {:.2f} EUR".format(x.value[i], products[0][i], _cost))
        print("Kopējās izmaksas: {:.2f} EUR".format(_summa))
    else:
        print("The problem was not solved successfully")
if __name__ == '__main__':
    main()
