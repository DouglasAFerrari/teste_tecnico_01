import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
        ),
        scaffoldBackgroundColor: Colors.white
    ),
  ));
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //variável soma que irá receber o resultado da função somaNum
  int soma = 0;
  void somaNum(valor){
    int resultado = 0;
    //loop até o limite do valor informado
    for (int e = 0; e < valor; e++) {
      //verificação de divisão por 3 e 5
      if ((e % 3) == 0 || (e % 5) == 0) {
        //caso for válido acrescenta o valor a variável soma
        resultado += e;
      }
    }
    setState(() {
      soma = resultado;
    });
  }

  TextEditingController _controlerNumero = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teste técnico 01",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.all(5),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                        Radius.circular(10)
                    ),
                    border: Border.all(width: 2, color: Colors.black)
                ),
                //widget para capturar o número digitado pelo usuário
                child: TextField(
                  autofocus: false,
                  controller: _controlerNumero,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Digite o número...',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //botão captura o número digitado pelo usuário e chama a função somaNum
              ElevatedButton(
                onPressed: (){
                  somaNum(int.parse(_controlerNumero.text));
                },
                child: Text(
                  "GERAR SOMA",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepOrange,
                  padding: EdgeInsets.all(12),
                  elevation: 10,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //botão limpar a tela
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    soma = 0;
                    _controlerNumero.text = "";
                  });
                },
                child: Text(
                  "LIMPAR",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepOrange,
                  padding: EdgeInsets.all(12),
                  elevation: 10,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //Se variável soma for diferente de 0 cria widget com o resultado da função somaNum
              if (soma != 0)...[
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        //margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                                Radius.circular(10)
                            ),
                            border: Border.all(width: 2, color: Colors.black)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Center(
                            child: Text("${soma}.",
                              style: TextStyle(
                                height: 1,
                                fontSize: 24,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}