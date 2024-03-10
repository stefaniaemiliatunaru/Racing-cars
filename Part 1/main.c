#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "structs.h"

void get_operations(void **operations);

typedef power_management_unit p_m_u;
typedef tire_sensor t_s;

/* functia de citire din fisierul binar */
sensor *citire(FILE *file_in, int *nr_sens)
{
	fread(nr_sens, sizeof(int), 1, file_in);
	sensor *v_sens = (sensor *)malloc((*nr_sens) * sizeof(sensor));
	/* dupa ce citesc numarul de senzori citesc informatiile fiecarui
	senzor in ordinea precizata in enunt si le adaug in vectorul
	de senzori */
	for (int i = 0; i < (*nr_sens); i++) {
		int type = 0;
		fread(&type, sizeof(int), 1, file_in);
		v_sens[i].sensor_type = type;
		/* in functie de tipul senzorului citesc informatiile caracteristice */
		/* senzor de tip TIRE */
		if (type == 0) {
			v_sens[i].sensor_data = (t_s *)malloc(sizeof(t_s));
			float auxp = 0;
			fread(&auxp, sizeof(float), 1, file_in);
			((t_s *)(v_sens[i].sensor_data))->pressure = auxp;
			float auxt = 0;
			fread(&auxt, sizeof(float), 1, file_in);
			((t_s *)(v_sens[i].sensor_data))->temperature = auxt;
			int auxwl = 0;
			fread(&auxwl, sizeof(int), 1, file_in);
			((t_s *)(v_sens[i].sensor_data))->wear_level = auxwl;
			int auxps = 0;
			fread(&auxps, sizeof(int), 1, file_in);
			((t_s *)(v_sens[i].sensor_data))->performace_score = auxps;
		}
		/* senzor de tip POWER MANAGEMENT UNIT */
		if (type == 1) {
			v_sens[i].sensor_data = (p_m_u *)malloc(sizeof(p_m_u));
			float auxv = 0;
			fread(&auxv, sizeof(float), 1, file_in);
			((p_m_u *)(v_sens[i].sensor_data))->voltage = auxv;
			float auxc = 0;
			fread(&auxc, sizeof(float), 1, file_in);
			((p_m_u *)(v_sens[i].sensor_data))->current = auxc;
			float auxpc = 0;
			fread(&auxpc, sizeof(float), 1, file_in);
			((p_m_u *)(v_sens[i].sensor_data))->power_consumption = auxpc;
			int auxer = 0;
			fread(&auxer, sizeof(int), 1, file_in);
			((p_m_u *)(v_sens[i].sensor_data))->energy_regen = auxer;
			int auxes = 0;
			fread(&auxes, sizeof(int), 1, file_in);
			((p_m_u *)(v_sens[i].sensor_data))->energy_storage = auxes;
		}
		/* citesc numarul de operatii */
		int nr_op = 0;
		fread(&nr_op, sizeof(int), 1, file_in);
		v_sens[i].nr_operations = nr_op;
		/* aloc vectorul de operatii al senzorului curent */
		v_sens[i].operations_idxs = (int *)malloc(nr_op * sizeof(int));
		int j = 0;
		/* parcurg numarul de operatii si adaug operatiile citite in
		vectorul de operatii al senzorului curent */
		for (j = 0; j < nr_op; j++) {
			int operation = 0;
			fread(&operation, sizeof(int), 1, file_in);
			v_sens[i].operations_idxs[j] = operation;
		}
	}
	/* intorc vectorul de senzori creat dupa citire */
	return v_sens;
}

/* functia de sortare a vectorului de senzori in functie de prioritatea lor */
void sortare(int nr_sens, sensor **v_sens)
{
	/* aloc 2 vectori de senzori in care voi pastra senzorii in
	functie de tipul lor, TIRE sau PMU */
	sensor *v_TIRE = (sensor *)malloc(nr_sens * sizeof(sensor));
	sensor *v_PMU = (sensor *)malloc(nr_sens * sizeof(sensor));
	int cnt_TIRE = 0, cnt_PMU = 0;
	/* parcurg vectorul de senzori si verific tipul senzorului curent
	apoi il adaug in vectorul destinat tipului respectiv */
	for (int i = 0; i < nr_sens; i++) {
		if ((*v_sens)[i].sensor_type == 0) {
			v_TIRE[cnt_TIRE] = (*v_sens)[i];
			cnt_TIRE++;
		}
		if ((*v_sens)[i].sensor_type == 1) {
			v_PMU[cnt_PMU] = (*v_sens)[i];
			cnt_PMU++;
		}
	}
	/* parcurg vectorul de senzori PMU si suprascriu vectorul initial
	de senzori cu acestia */
	int crt = 0;
	for (int i = 0; i < cnt_PMU; i++) {
		(*v_sens)[crt] = v_PMU[i];
		crt++;
	}
	/* parcurg vectorul de senzori TIRE si suprascriu restul vectorului
	initial de senzori cu acestia */
	for (int i = 0; i < cnt_TIRE; i++) {
		(*v_sens)[crt] = v_TIRE[i];
		crt++;
	}
	/* eliberez memoria ocupata de cei doi vectori de senzori auxiliari */
	free(v_TIRE);
	free(v_PMU);
}

/* functia de PRINT */
void PRINT(int nr_sens, sensor *v_sens, int ind)
{
	/* verific daca indexul senzorului de printat este valid */
	if (ind >= 0 && ind < nr_sens) {
		/* afisez informatia senzorului conform cerintei in functie de tip */
		if (v_sens[ind].sensor_type == 0) {
			printf("Tire Sensor\n");
			printf("Pressure: ");
			printf("%.2f\n", ((t_s *)(v_sens[ind].sensor_data))->pressure);
			printf("Temperature: ");
			printf("%.2f\n", ((t_s *)(v_sens[ind].sensor_data))->temperature);
			printf("Wear Level: ");
			printf("%d", ((t_s *)(v_sens[ind].sensor_data))->wear_level);
			printf("%c\n", '%');
			printf("Performance Score: ");
			int ps = ((t_s *)(v_sens[ind].sensor_data))->performace_score;
			if (ps == 0)
				printf("Not Calculated\n");
			else
				printf("%d\n", ps);
		}
		if (v_sens[ind].sensor_type == 1) {
			printf("Power Management Unit\n");
			printf("Voltage: ");
			printf("%.2f\n", ((p_m_u *)(v_sens[ind].sensor_data))->voltage);
			printf("Current: ");
			printf("%.2f\n", ((p_m_u *)(v_sens[ind].sensor_data))->current);
			printf("Power Consumption: ");
			float pc = ((p_m_u *)(v_sens[ind].sensor_data))->power_consumption;
			printf("%.2f\n", pc);
			printf("Energy Regen: ");
			printf("%d", ((p_m_u *)(v_sens[ind].sensor_data))->energy_regen);
			printf("%c\n", '%');
			printf("Energy Storage: ");
			printf("%d", ((p_m_u *)(v_sens[ind].sensor_data))->energy_storage);
			printf("%c\n", '%');
		}
	} else {
		/* indexul senzorului este invalid */
		printf("Index not in range!\n");
	}
}

/* functia de CLEAR */
void CLEAR(int *nr_sens, sensor **v_sens)
{
	/* parcurg vectorul de senzori si verific tipul senzorilor */
	for (int i = 0; i < (*nr_sens); i++) {
		if ((*v_sens)[i].sensor_type == 0) {
			float pressure = ((t_s *)((*v_sens)[i].sensor_data))->pressure;
			float auxt = ((t_s *)((*v_sens)[i].sensor_data))->temperature;
			int wear_level = ((t_s *)((*v_sens)[i].sensor_data))->wear_level;
			/* verific daca pressure nu apartine intervalului precizat, caz
			in care elimin senzorul curent din vectorul de senzori */
			if (!(pressure >= 19 && pressure <= 28)) {
				sensor aux = (*v_sens)[i];
				for (int j = i; j < (*nr_sens) - 1; j++)
					(*v_sens)[j] = (*v_sens)[j + 1];
				(*v_sens)[(*nr_sens) - 1] = aux;
				/* eliberez memoria ocupata de informatiile senzorului
				eliminat */
				free((*v_sens)[(*nr_sens) - 1].sensor_data);
				free((*v_sens)[(*nr_sens) - 1].operations_idxs);
				(*nr_sens)--;
				/* realoc memoria vectorului de senzori cu noul numar
				de senzori */
				(*v_sens) = realloc((*v_sens), (*nr_sens) * sizeof(sensor));
				i--;
				/* verific daca temperature nu apartine intervalului
				precizat, caz in care elimin senzorul curent din vectorul
				de senzori */
			} else if (!(auxt >= 0 && auxt <= 120)) {
				sensor aux = (*v_sens)[i];
				for (int j = i; j < (*nr_sens) - 1; j++)
					(*v_sens)[j] = (*v_sens)[j + 1];
				(*v_sens)[(*nr_sens) - 1] = aux;
				/* eliberez memoria ocupata de informatiile
				senzorului eliminat */
				free((*v_sens)[(*nr_sens) - 1].sensor_data);
				free((*v_sens)[(*nr_sens) - 1].operations_idxs);
				(*nr_sens)--;
				/* realoc memoria vectorului de senzori cu noul
				numar de senzori */
				(*v_sens) = realloc((*v_sens), (*nr_sens) * sizeof(sensor));
				i--;
				/* verific daca wear_level nu apartine intervalului
				precizat, caz in care elimin senzorul curent din vectorul
				de senzori */
			} else if (!(wear_level >= 0 && wear_level <= 100)) {
				sensor aux = (*v_sens)[i];
				for (int j = i; j < (*nr_sens) - 1; j++)
					(*v_sens)[j] = (*v_sens)[j + 1];
				(*v_sens)[(*nr_sens) - 1] = aux;
				/* eliberez memoria ocupata de informatiile senzorului
				eliminat */
				free((*v_sens)[(*nr_sens) - 1].sensor_data);
				free((*v_sens)[(*nr_sens) - 1].operations_idxs);
				(*nr_sens)--;
				/* realoc memoria vectorului de senzori cu noul numar de
				senzori */
				(*v_sens) = realloc((*v_sens), (*nr_sens) * sizeof(sensor));
				i--;
			}
		}
		if ((*v_sens)[i].sensor_type == 1) {
			float voltage = ((p_m_u *)((*v_sens)[i].sensor_data))->voltage;
			float current = ((p_m_u *)((*v_sens)[i].sensor_data))->current;
			float pc = ((p_m_u *)((*v_sens)[i].sensor_data))->power_consumption;
			int er = ((p_m_u *)((*v_sens)[i].sensor_data))->energy_regen;
			int es = ((p_m_u *)((*v_sens)[i].sensor_data))->energy_storage;
			/* verific daca voltage nu apartine intervalului precizat,
			caz in care elimin senzorul curent din vectorul de senzori */
			if (!(voltage >= 10 && voltage <= 20)) {
				sensor aux = (*v_sens)[i];
				for (int j = i; j < (*nr_sens) - 1; j++)
					(*v_sens)[j] = (*v_sens)[j + 1];
				(*v_sens)[(*nr_sens) - 1] = aux;
				/* eliberez memoria ocupata de informatiile senzorului
				eliminat */
				free((*v_sens)[(*nr_sens) - 1].sensor_data);
				free((*v_sens)[(*nr_sens) - 1].operations_idxs);
				(*nr_sens)--;
				/* realoc memoria vectorului de senzori cu noul numar
				de senzori */
				(*v_sens) = realloc((*v_sens), (*nr_sens) * sizeof(sensor));
				i--;
				/* verific daca current nu apartine intervalului precizat,
				caz in care elimin senzorul curent din vectorul de senzori */
			} else if (!(current >= -100 && current <= 100)) {
				sensor aux = (*v_sens)[i];
				for (int j = i; j < (*nr_sens) - 1; j++)
					(*v_sens)[j] = (*v_sens)[j + 1];
				(*v_sens)[(*nr_sens) - 1] = aux;
				/* eliberez memoria ocupata de informatiile senzorului
				eliminat */
				free((*v_sens)[(*nr_sens) - 1].sensor_data);
				free((*v_sens)[(*nr_sens) - 1].operations_idxs);
				(*nr_sens)--;
				/* realoc memoria vectorului de senzori cu noul numar
				de senzori */
				(*v_sens) = realloc((*v_sens), (*nr_sens) * sizeof(sensor));
				i--;
				/* verific daca power consumption nu apartine intervalului
				precizat, caz in care elimin senzorul curent din vectorul
				de senzori */
			} else if (!(pc >= 0 && pc <= 1000)) {
				sensor aux = (*v_sens)[i];
				for (int j = i; j < (*nr_sens) - 1; j++)
					(*v_sens)[j] = (*v_sens)[j + 1];
				(*v_sens)[(*nr_sens) - 1] = aux;
				/* eliberez memoria ocupata de informatiile senzorului
				eliminat */
				free((*v_sens)[(*nr_sens) - 1].sensor_data);
				free((*v_sens)[(*nr_sens) - 1].operations_idxs);
				(*nr_sens)--;
				/* realoc memoria vectorului de senzori cu noul numar
				de senzori */
				(*v_sens) = realloc((*v_sens), (*nr_sens) * sizeof(sensor));
				i--;
				/* verific daca energy regen si energy storage nu apartin
				intervalului precizat, caz in care elimin senzorul curent
				din vectorul de senzori */
			} else if (!(er >= 0 && er <= 100 && es >= 0 && es <= 100)) {
				sensor aux = (*v_sens)[i];
				for (int j = i; j < (*nr_sens) - 1; j++)
					(*v_sens)[j] = (*v_sens)[j + 1];
				(*v_sens)[(*nr_sens) - 1] = aux;
				/* eliberez memoria ocupata de informatiile senzorului
				eliminat */
				free((*v_sens)[(*nr_sens) - 1].sensor_data);
				free((*v_sens)[(*nr_sens) - 1].operations_idxs);
				(*nr_sens)--;
				/* realoc memoria vectorului de senzori cu noul numar
				de senzori */
				(*v_sens) = realloc((*v_sens), (*nr_sens) * sizeof(sensor));
				i--;
			}
		}
	}
}

int main(int argc, char const *argv[])
{
	/* deschid fisierul binar pentru citire */
	FILE *file_in = fopen(argv[1], "rb");
	int nr_sens = 0;
	/* apelez functia de citire a informatiilor din fisierul binar */
	sensor *v_sens = citire(file_in, &nr_sens);
	/* apelez functia de sortare a vectorului de senzori */
	sortare(nr_sens, &v_sens);
	char comanda[105];
	void *op[8];
	get_operations(op);
	void (*f_op[8])(void *);
	for (int i = 0; i < 8; i++)
		f_op[i] = op[i];
	/* declar un vector de pointeri la functii pe care il umplu folosindu-ma
	de functia data get_operations */
	/* citesc comenzile primite de la tastatura */
	while (scanf("%s", comanda)) {
		/* daca comanda citita este de tip exit eliberez memoria si
		opresc programul */
		if (strcmp(comanda, "exit") == 0) {
			int i = 0;
			for (i = 0; i < nr_sens; i++) {
				free(v_sens[i].operations_idxs);
				free(v_sens[i].sensor_data);
			}
			free(v_sens);
			break;
		}
		/* daca comanda citita este print se citeste indexul senzorului
		si se apeleaza comanda definita anterior */
		if (strcmp(comanda, "print") == 0) {
			int ind = 0;
			scanf("%d", &ind);
			PRINT(nr_sens, v_sens, ind);
		}
		/* daca comanda citita este analyze se citeste indexul senzorului */
		if (strcmp(comanda, "analyze") == 0) {
			int index = 0;
			scanf("%d", &index);
			/* se verifica daca indexul este valid */
			if (index >= 0 && index <= nr_sens) {
				int i = 0;
				/* se parcurge vectorul de operatii si se apeleaza operatiile
				din vectorul de operatii */
				for (i = 0; i < v_sens[index].nr_operations; i++) {
					void *sd = v_sens[index].sensor_data;
					f_op[v_sens[index].operations_idxs[i]](sd);
				}
			} else {
				/* indexul este invalid */
				printf("Index not in range!\n");
			}
		}
		/* daca comanda citita este clear se citeste indexul senzorului
		si se apeleaza functia clear definita anterior */
		if (strcmp(comanda, "clear") == 0)
			CLEAR(&nr_sens, &v_sens);
	}
	/* se inchide fisierul de citire */
	fclose(file_in);
	return 0;
}
