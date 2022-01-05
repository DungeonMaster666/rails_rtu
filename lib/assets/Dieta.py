from cvxopt.modeling import variable, op
import sys
import psycopg2

def main():
    id = sys.argv[1]
    conn = psycopg2.connect("dbname=rtu_rails user=janis password=eiduks")
    cursor = conn.cursor()

    cursor.execute('SELECT * FROM bazesprods')
    bazesprods_all = cursor.fetchall()
    bazesprods_all = [list(el)[1:] for el in bazesprods_all]
    for i in bazesprods_all:
        for j in range(1,13):
            i[j] = float(i[j])

    cursor.execute('SELECT * FROM velprods')
    velprods_all = cursor.fetchall()
    velprods_all = [list(el)[2:] for el in velprods_all]
    for i in velprods_all:
        for j in range(1,13):
            i[j] = float(i[j])
    cursor.execute('SELECT * FROM nevelprods')
    nevelprods_all = cursor.fetchall()
    nevelprods_all = [list(el)[2] for el in nevelprods_all]

    cursor.execute(f'SELECT svars, augums, vecums, dzimums, koef, goal FROM lietotajaparametrs WHERE user_id={id}')
    lparams = cursor.fetchall()
    lparams = list(lparams.pop(0))

    initial_products = bazesprods_all
    # [['auzu putraimi', 13, 6.5, 61.1, 380, 0, 0.6, 0.14, 0, 75, 327, 4.3, 0.092],['griķu putraimi', 12.5, 2.5, 67.4, 354, 0, 0.6, 0.14, 0, 75, 327, 4.3, 0.185],['grūbas', 8.9, 1.2, 72.4, 345, 0, 0.3, 0.1, 0, 42, 236, 2.1, 0.226], ['bietes', 1.3, 0, 10.8, 15, 0, 0.02, 0.05, 10, 28, 43, 1.4, 0.2]];
    wanted_products = velprods_all
    #[['kaviars', 31.6, 13.8, 0, 258, 0.45, 0, 0, 0, 119, 179, 3.1, 0.42], ['griķu putraimi', 13, 6.5, 61.1, 380, 0, 0.6, 0.14, 0, 75, 327, 4.3, 0.5]]
    unwanted_products = nevelprods_all
    #["auzu putraimi"]

    # svars, augums, vecums, dzimums, sporta koeficents, meeerkis
    lietotaja_dati = lparams
    #[89, 193, 21, 'v', 1.2, 1]

    limits=[0]*(len(initial_products[0])-2)
    if (lietotaja_dati[3]=='V'):
        limits[3]=(10*lietotaja_dati[0]+6.25*lietotaja_dati[1]-5*lietotaja_dati[2]+5)*lietotaja_dati[4]
        if (lietotaja_dati[5]==0):
            limits[0]=(0.3*limits[3])/4
            limits[1]=(0.3*limits[3])/9
            limits[2]=(0.4*limits[3])/4
        elif (lietotaja_dati[5]==1):
            limits[0]=(0.4*limits[3])/4
            limits[1]=(0.2*limits[3])/9
            limits[2]=(0.4*limits[3])/4
        elif (lietotaja_dati[5]==2):
            limits[0]=(0.47*limits[3])/4
            limits[1]=(0.23*limits[3])/9
            limits[2]=(0.3*limits[3])/4
        elif (lietotaja_dati[5]==3):
            limits[0]=(0.5*limits[3])/4
            limits[1]=(0.2*limits[3])/9
            limits[2]=(0.3*limits[3])/4
        elif (lietotaja_dati[5]==4):
            limits[0]=(0.3*limits[3])/4
            limits[1]=(0.2*limits[3])/9
            limits[2]=(0.5*limits[3])/4
        if (lietotaja_dati[2]<=11):
            limits[4]=0.7
            limits[5]=1.05
            limits[6]=1.2
            limits[7]=60
            limits[8]=1050
            limits[9]=1050
            limits[10]=12
        elif(lietotaja_dati[2]>11 and lietotaja_dati[2]<=14):
            limits[4]=1
            limits[5]=1.3
            limits[6]=1.5
            limits[7]=72.5
            limits[8]=1200
            limits[9]=1200
            limits[10]=12
        elif(lietotaja_dati[2]>14 and lietotaja_dati[2]<=18):
            limits[4]=1
            limits[5]=1.5
            limits[6]=1.8
            limits[7]=85
            limits[8]=1200
            limits[9]=1200
            limits[10]=13.5
        elif(lietotaja_dati[2]>18 and lietotaja_dati[2]<=60):
            limits[4]=0.95
            limits[5]=1.55
            limits[6]=1.9
            limits[7]=85
            limits[8]=1100
            limits[9]=1000
            limits[10]=12.5
        elif(lietotaja_dati[2]>60 and lietotaja_dati[2]<=75):
            limits[4]=0.95
            limits[5]=1.6
            limits[6]=1.75
            limits[7]=95
            limits[8]=1000
            limits[9]=1000
            limits[10]=12.5
        elif(lietotaja_dati[2]>75):
            limits[4]=0.95
            limits[5]=1.5
            limits[6]=1.65
            limits[7]=90
            limits[8]=1000
            limits[9]=1000
            limits[10]=12.5
    elif (lietotaja_dati[3]=='S'):
        limits[3]=(10*lietotaja_dati[0]+6,25*lietotaja_dati[1]-5*lietotaja_dati[2]-161)*lietotaja_dati[4]
        if (lietotaja_dati[5]==0):
            limits[0]=(0.3*limits[3])/4
            limits[1]=(0.3*limits[3])/9
            limits[2]=(0.4*limits[3])/4
        elif (lietotaja_dati[5]==1):
            limits[0]=(0.4*limits[3])/4
            limits[1]=(0.2*limits[3])/9
            limits[2]=(0.4*limits[3])/4
        elif (lietotaja_dati[5]==2):
            limits[0]=(0.47*limits[3])/4
            limits[1]=(0.23*limits[3])/9
            limits[2]=(0.3*limits[3])/4
        elif (lietotaja_dati[5]==3):
            limits[0]=(0.5*limits[3])/4
            limits[1]=(0.2*limits[3])/9
            limits[2]=(0.3*limits[3])/4
        elif (lietotaja_dati[5]==4):
            limits[0]=(0.3*limits[3])/4
            limits[1]=(0.2*limits[3])/9
            limits[2]=(0.5*limits[3])/4
        if (lietotaja_dati[2]<=11):
            limits[4]=0.7
            limits[5]=1.05
            limits[6]=1.2
            limits[7]=60
            limits[8]=1050
            limits[9]=1050
            limits[10]=12
        elif(lietotaja_dati[2]>11 and lietotaja_dati[2]<=14):
            limits[4]=0.8
            limits[5]=1.2
            limits[6]=1.4
            limits[7]=65
            limits[8]=1200
            limits[9]=1200
            limits[10]=15
        elif(lietotaja_dati[2]>14 and lietotaja_dati[2]<=18):
            limits[4]=0.9
            limits[5]=1.25
            limits[6]=1.5
            limits[7]=72.5
            limits[8]=1200
            limits[9]=1200
            limits[10]=16.5
        elif(lietotaja_dati[2]>18 and lietotaja_dati[2]<=60):
            limits[4]=0.95
            limits[5]=1.4
            limits[6]=1.7
            limits[7]=80
            limits[8]=1050
            limits[9]=1000
            limits[10]=17.5
        elif(lietotaja_dati[2]>60 and lietotaja_dati[2]<=75):
            limits[4]=1
            limits[5]=1.5
            limits[6]=1.65
            limits[7]=95
            limits[8]=1100
            limits[9]=1000
            limits[10]=16.5
        elif(lietotaja_dati[2]>75):
            limits[4]=1
            limits[5]=1.5
            limits[6]=1.65
            limits[7]=90
            limits[8]=1100
            limits[9]=1000
            limits[10]=16.5

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
    rezultats = []
    if problem.status == "optimal":
        for i in range(len(x)):
            dictionary= { "prodnos": products[0][i], "quantity": x.value[i]*100, "user_id": id  }
            rezultats.append(dictionary)
    else:
        rezultats={}
        rezultats={"user_id": sys.argv[1], "nutrition1": 1}

    columns = rezultats[0].keys()
    insert_query = "INSERT INTO edienkartes ({}) VALUES %s".format(','.join(columns))
    values = [[value for value in rezultat.values()] for rezultat in rezultats]
    execute_values(cursor, insert_query, values)
    conn.commit()
if __name__ == '__main__':
    main()

