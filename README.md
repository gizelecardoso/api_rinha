# README

This project is based on the challenge - 'Rinha de Backend'

[GitHub Link](https://github.com/zanfranceschi/rinha-de-backend-2023-q3/blob/main/INSTRUCOES.md)

Things you may want to cover:

* Ruby version - ruby 3.1.2p20

* System dependencies - postgresql

* Database creation
  infos in the file - config/database.yml

* API tests

  1. List people:
      * `path: get /pessoas`

      * result is a list of people with the status: 200 OK
  ___

  2. Create person:
      * `path: post /pessoas`

      ```
      body:
        {
          "apelido" : "Joe",
          "nome" : "José Roberto",
          "nascimento" : "2000-10-01",
          "stack" : ["C#", "Node", "Oracle"]
        }
      ```

      * result is the object created with the status: 201 Created

  ___

  3. Doesn't create person:
      * `path: post /pessoas`

      3.1 - Apelido
      * when the 'apelido' already exists:

        ```
        body:
          {
            "apelido" : "Joe",
            "nome" : "José Roberto",
            "nascimento" : "2000-10-01",
            "stack" : ["C#", "Node", "Oracle"]
          }
        ```

        result is the status: 422 Unprocessable Entity

      * when the 'apelido' has more than 32 characteres:

        ```
        body:
          {
            "apelido" : "José Roberto dos Santos de Soares",
            "nome" : "José Roberto",
            "nascimento" : "2000-10-01",
            "stack" : ["C#", "Node", "Oracle"]
          }
        ```

        result is the status: 422 Unprocessable Entity

         * when the 'apelido' isn't send:

        ```
        body:
          {
            "apelido" : null,
            "nome" : "José Roberto",
            "nascimento" : "2000-10-01",
            "stack" : ["C#", "Node", "Oracle"]
          }
        ```

        result is the status: 422 Unprocessable Entity

      3.2 - Nome
      * when the 'nome' has more than 100 characteres:

        ```
        body:
          {
            "apelido" : "Joe",
            "nome" : "José Roberto dos Santos de Soares Nascimento Roberto Silva Teixeira Nunes Souza da Silva Sauro Junior",
            "nascimento" : "2000-10-01",
            "stack" : ["C#", "Node", "Oracle"]
          }
        ```

        result is the status: 422 Unprocessable Entity

         * when the 'nome' isn't send:

        ```
        body:
          {
            "apelido" : "Joe",
            "nome" : null,
            "nascimento" : "2000-10-01",
            "stack" : ["C#", "Node", "Oracle"]
          }
        ```

        result is the status: 422 Unprocessable Entity

      3.3 - Nascimento
      * when the 'nascimento' isn't in the correct format:

        ```
        body:
          {
            "apelido" : "Joe",
            "nome" : "José Roberto dos Santos de Soares Nascimento Roberto Silva Teixeira Nunes Souza da Silva Sauro Junior",
            "nascimento" : "2000",
            "stack" : ["C#", "Node", "Oracle"]
          }
        ```

        result is the status: 422 Unprocessable Entity

         * when the 'nascimento' isn't send:

        ```
        body:
          {
            "apelido" : "Joe",
            "nome" : "José Roberto",
            "nascimento" : null,
            "stack" : ["C#", "Node", "Oracle"]
          }
        ```

        result is the status: 422 Unprocessable Entity

      3.3 - Stack
        - Building ......
  ___

  4. Find people by some word:
      * `path: get /pessoas?t=José`

      result is list of people found the status: 200 OK.

  ___

  5. People count:
      * `path: get /contagem-pessoas`

      result is count of people with the status: 200 OK.
