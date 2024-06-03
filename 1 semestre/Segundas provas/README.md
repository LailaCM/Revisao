# Revisão
## Revisão SOP

### O que é segurança cibernética?

- **Segurança cibernética** é o conjunto de **medidas e práticas para proteger sistemas computacionais**, redes e dados contra ataques e ameaças digitais, garantindo sua integridade, confidencialidade e disponibilidade.

### Qual a importância da Segurança Cibernética?
- Segurança Cibernética é crucial para proteger dados, sistemas e serviços contra ameaças digitais, garantindo integridade, disponibilidade e confidencialidade, evitando prejuízos financeiros e preservando a reputação das organizações.

### Evolução da Segurança Cibernética
- A Segurança Cibernética evoluiu de medidas básicas para formas mais avançadas, incorporando tecnologias como inteligência artificial e aprendizado de máquina para detectar e responder a ameaças, impulsionando investimentos e treinamentos para evitar riscos crescentes.

### O que são vulnerabilidades?
- Vulnerabilidades são fraquezas em sistemas, redes ou aplicativos que podem ser exploradas por invasores para comprometer a segurança e permitir acesso não autorizado, roubo de dados ou interrupção dos serviços. 

### Principais vulnerabilidades
- Falhas de software, como falta de atualizações de segurança. A engenharia social, que explora a confiança dos usuários, e configurações inadequadas de sistemas também representam ameaças significativas à segurança cibernética.

### Ataques comuns

- As **ameaças cibernéticas mais comuns** incluem **malware**, como vírus e ransomware, **ataques de phishing** que visam obter informações pessoais e financeiras, e **violações de dados** por meio de vulnerabilidades de segurança em sistemas e redes.

### Principais vírus
- Vírus de arquivo, de boot, de macro, worms, cavalos de Troia e ransomware, cada um com métodos específicos de infecção e impacto nos sistemas.

### Ataques famosos

- O **ataque à SolarWinds** foi um ataque de cadeia de suprimentos que comprometeu o software de gerenciamento de rede da SolarWinds, chamado Orion, **distribuindo um malware chamado "Sunburst"**. Isso permitiu aos invasores acesso não autorizado a milhares de organizações em todo o mundo, levantando preocupações sobre a segurança cibernética das cadeias de suprimentos de software.

### Antivírus mais famoso
- O Norton Antivirus, desenvolvido pela NortonLifeLock, ganhou grande destaque como um dos antivírus mais reconhecidos por sua eficácia na detecção e remoção de ameaças cibernéticas.


## Revisão LOP

### Programação em C

|Exercício 1|
|-|
|_Crie um programa em C que lê o conteúdo de dois arquivos de texto e os mescla em um terceiro arquivo, alternando as linhas de cada um._|
``` 
#include <stdio.h>
#include <stdlib.h>

int main() {
    FILE *arquivo1, *arquivo2, *arquivo3;
    char linha[100];
    int alternar = 0; // Variável para alternar entre os arquivos

    // Abre os arquivos de entrada
    arquivo1 = fopen("arquivo1.txt", "r");
    arquivo2 = fopen("arquivo2.txt", "r");
    
    // Verifica se os arquivos foram abertos corretamente
    if (arquivo1 == NULL || arquivo2 == NULL) {
        printf("Erro ao abrir os arquivos de entrada.");
        return 1;
    }

    // Abre o arquivo de saída
    arquivo3 = fopen("arquivo3.txt", "w");

    // Mescla os arquivos
    while (1) {
        if (alternar == 0) {
            if (fgets(linha, sizeof(linha), arquivo1) != NULL) {
                fputs(linha, arquivo3);
            } else {
                break;
            }
            alternar = 1;
        } else {
            if (fgets(linha, sizeof(linha), arquivo2) != NULL) {
                fputs(linha, arquivo3);
            } else {
                break;
            }
            alternar = 0;
        }
    }

    // Fecha os arquivos
    fclose(arquivo1);
    fclose(arquivo2);
    fclose(arquivo3);

    printf("Arquivos mesclados com sucesso.\n");

    return 0;
}
```
|***Exercício 2*** |
|-|
|_Crie um programa em C que lê um arquivo contendo código-fonte em C e remove todos os comentários, salvando o resultado em outro arquivo._|

```
#include <stdio.h>
#include <stdlib.h>
#include <locale.h>

int main() {
	
	setlocale(LC_ALL,"");
	
    FILE *entrada, *saida;
    char caractere, proximo;

    // Abre o arquivo de entrada para leitura
    entrada = fopen("codigofonte.c", "r");
    if (entrada == NULL) {
        printf("Erro ao abrir o arquivo de entrada.");
        return 1;
    }

    // Abre o arquivo de saída para escrita
    saida = fopen("codigo_sem_comentarios.c", "w");
    if (saida == NULL) {
        printf("Erro ao abrir o arquivo de saída.");
        fclose(entrada);
        return 1;
    }

    // Processa o arquivo de entrada
    while ((caractere = fgetc(entrada)) != EOF) {
        if (caractere == '/') {
            proximo = fgetc(entrada);
            if (proximo == '/') { // Comentário de linha
                while ((caractere = fgetc(entrada)) != '\n' && caractere != EOF);
            } else if (proximo == '*') { // Comentário de bloco
                do {
                    while ((caractere = fgetc(entrada)) != '*') {
                        if (caractere == EOF) {
                            printf("Erro: Comentário de bloco não fechado.\n");
                            fclose(entrada);
                            fclose(saida);
                            return 1;
                        }
                    }
                    proximo = fgetc(entrada);
                } while (proximo != '/');
            } else {
                fputc(caractere, saida);
                fputc(proximo, saida);
            }
        } else {
            fputc(caractere, saida);
        }
    }

    // Fecha os arquivos
    fclose(entrada);
    fclose(saida);

    printf("Comentários removidos com sucesso.\n");

    return 0;
}
```

|***Exercício 3*** |
|-|
|_Crie um programa em C que lê um arquivo de texto e cria outro arquivo onde todos os espaços em branco e quebras de linha são removidos._|

```
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <locale.h>

int main() {
	setlocale(LC_ALL,"");
	
    FILE *entrada, *saida;
    char caractere;

    // Abre o arquivo de entrada para leitura
    entrada = fopen("arquivo_origem.txt", "r");
    if (entrada == NULL) {
        printf("Erro ao abrir o arquivo de entrada.");
        return 1;
    }

    // Abre o arquivo de saída para escrita
    saida = fopen("arquivo_sem_espacos.txt", "w");
    if (saida == NULL) {
        printf("Erro ao abrir o arquivo de saída.");
        fclose(entrada);
        return 1;
    }

    // Processa o arquivo de entrada
    while ((caractere = fgetc(entrada)) != EOF) {
        if (!isspace(caractere)) { // Verifica se não é espaço em branco
            fputc(caractere, saida);
        }
    }

    // Fecha os arquivos
    fclose(entrada);
    fclose(saida);

    printf("Espaços em branco removidos com sucesso.\n");

    return 0;
}

```

|***Exercício 4*** |
|-|
|_Crie um programa em C que lê um arquivo de texto e conta a frequência de cada palavra, salvando o resultado em um arquivo separado._|

```
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <locale.h>

#define MAX_SIZE 100

// Estrutura para armazenar a palavra e sua frequência
typedef struct {
    char palavra[MAX_SIZE];
    int frequencia;
} Registro;

// Função para normalizar uma palavra (remover pontuações e tornar minúscula)
void normalizarPalavra(char *palavra) {
    int i, j = 0;
    char novaPalavra[MAX_SIZE];

    for (i = 0; palavra[i] != '\0'; i++) {
        if (isalpha(palavra[i])) {
            novaPalavra[j++] = tolower(palavra[i]);
        }
    }
    novaPalavra[j] = '\0';
    strcpy(palavra, novaPalavra);
}

int main() {
	setlocale(LC_ALL,"");
	
    FILE *entrada, *saida;
    char palavra[MAX_SIZE];
    Registro registros[MAX_SIZE];
    int numRegistros = 0;

    // Abre o arquivo de entrada para leitura
    entrada = fopen("arquivo_entrada.txt", "r");
    if (entrada == NULL) {
        printf("Erro ao abrir o arquivo de entrada.");
        return 1;
    }

    // Processa o arquivo de entrada
    while (fscanf(entrada, "%s", palavra) != EOF) {
        normalizarPalavra(palavra);

        // Verifica se a palavra já foi registrada
        int i, encontrada = 0;
        for (i = 0; i < numRegistros; i++) {
            if (strcmp(registros[i].palavra, palavra) == 0) {
                registros[i].frequencia++;
                encontrada = 1;
                break;
            }
        }
        // Se a palavra não foi encontrada, adiciona ao registro
        if (!encontrada) {
            strcpy(registros[numRegistros].palavra, palavra);
            registros[numRegistros].frequencia = 1;
            numRegistros++;
        }
    }

    // Fecha o arquivo de entrada
    fclose(entrada);

    // Abre o arquivo de saída para escrita
    saida = fopen("frequencia_palavras.txt", "w");
    if (saida == NULL) {
        printf("Erro ao abrir o arquivo de saída.");
        return 1;
    }

    // Escreve a frequência das palavras no arquivo de saída
    int i;
    for (i = 0; i < numRegistros; i++) {
        fprintf(saida, "%s: %d\n", registros[i].palavra, registros[i].frequencia);
    }

    // Fecha o arquivo de saída
    fclose(saida);

    printf("Frequência das palavras salva com sucesso.\n");

    return 0;
}
```

|***Exercício 5*** |
|-|
|_Crie um programa em C que lê um arquivo de texto, encripta seu conteúdo usando uma cifra de substituição simples, e salva o resultado em outro arquivo._|

```
#include <stdio.h>
#include <stdlib.h>
#include <locale.h>

#define SHIFT 3 // Número de deslocamento para a cifra de substituição

int main() {
	setlocale(LC_ALL,"");
    FILE *entrada, *saida;
    char caractere;

    // Abre o arquivo de entrada para leitura
    entrada = fopen("arquivo_original.txt", "r");
    if (entrada == NULL) {
        printf("Erro ao abrir o arquivo de entrada.");
        return 1;
    }

    // Abre o arquivo de saída para escrita
    saida = fopen("arquivo_criptografado.txt", "w");
    if (saida == NULL) {
        printf("Erro ao abrir o arquivo de saída.");
        fclose(entrada);
        return 1;
    }

    // Criptografa o arquivo de entrada e escreve no arquivo de saída
    while ((caractere = fgetc(entrada)) != EOF) {
        if (caractere >= 'a' && caractere <= 'z') {
            caractere = 'a' + (caractere - 'a' + SHIFT) % 26;
        } else if (caractere >= 'A' && caractere <= 'Z') {
            caractere = 'A' + (caractere - 'A' + SHIFT) % 26;
        }
        fputc(caractere, saida);
    }

    // Fecha os arquivos
    fclose(entrada);
    fclose(saida);

    printf("Arquivo criptografado com sucesso.\n");

    return 0;
}
```

|***Exercício 6*** |
|-|
|_Crie um programa em C que lê o arquivo de texto do ex 5, desencripta seu conteúdo e salva o resultado em outro arquivo._|
```
#include <stdio.h>
#include <stdlib.h>
#include <locale.h>

#define SHIFT 3 // Número de deslocamento para a cifra de substituição

int main() {
	setlocale(LC_ALL,"");
    FILE *entrada, *saida;
    char caractere;

    // Abre o arquivo de entrada para leitura
    entrada = fopen("arquivo_criptografado.txt", "r");
    if (entrada == NULL) {
        printf("Erro ao abrir o arquivo de entrada.");
        return 1;
    }

    // Abre o arquivo de saída para escrita
    saida = fopen("arquivo_descriptografado.txt", "w");
    if (saida == NULL) {
        printf("Erro ao abrir o arquivo de saída.");
        fclose(entrada);
        return 1;
    }

    // Descriptografa o arquivo de entrada e escreve no arquivo de saída
    while ((caractere = fgetc(entrada)) != EOF) {
        if (caractere >= 'a' && caractere <= 'z') {
            caractere = 'a' + (caractere - 'a' - SHIFT + 26) % 26;
        } else if (caractere >= 'A' && caractere <= 'Z') {
            caractere = 'A' + (caractere - 'A' - SHIFT + 26) % 26;
        }
        fputc(caractere, saida);
    }

    // Fecha os arquivos
    fclose(entrada);
    fclose(saida);

    printf("Arquivo descriptografado com sucesso.\n");

    return 0;
}
```

## Revisão AIOT
