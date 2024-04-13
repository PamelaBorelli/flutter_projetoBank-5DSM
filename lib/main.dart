import 'package:flutter/material.dart';

void main() => runApp(BankApp());

class BankApp extends StatelessWidget {
  BankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
      home: Dashboard(),
=======
      home: Scaffold(
        body: ListaTransferencias(),
      ),
>>>>>>> 39ee184f88b75e09484f01de07a22a199aa3a448
    );
  }
}

<<<<<<< HEAD
//Dashboard
//=======================================================================================================================================

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Dashboard',
        style: TextStyle(
=======
class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  FormularioTransferencia({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Nova Transferência',
          style: TextStyle(
>>>>>>> 39ee184f88b75e09484f01de07a22a199aa3a448
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
<<<<<<< HEAD
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Contatos'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ListaContatos()));
            },
          ),
          ListTile(
            leading: Icon(Icons.monetization_on),
            title: Text('Transferência'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ListaTransferencias()));
=======
        children: [
          Editor(
            controlador: _controladorCampoNumeroConta,
            rotulo: 'Numero da Conta',
            dica: '0000',
          ),
          Editor(
            controlador: _controladorCampoValor,
            rotulo: 'Valor',
            dica: '0.00',
            icone: Icons.monetization_on,
          ),
          ElevatedButton(
            child: Text('Confirmar'),
            onPressed: () {
              _criaTransferencia(
                context,
                _controladorCampoNumeroConta,
                _controladorCampoValor,
              );
>>>>>>> 39ee184f88b75e09484f01de07a22a199aa3a448
            },
          ),
        ],
      ),
    );
  }
<<<<<<< HEAD
}

//Lista e Formulario de contatos
//=======================================================================================================================================

class FormularioContato extends StatelessWidget {
  final TextEditingController _controladorCampoNome = TextEditingController();
  final TextEditingController _controladorCampoEndereco = TextEditingController();
  final TextEditingController _controladorCampoTelefone = TextEditingController();
  final TextEditingController _controladorCampoEmail = TextEditingController();
  final TextEditingController _controladorCampoCPF = TextEditingController();

  FormularioContato({Contato? contato}) {
    if (contato != null) {
      _controladorCampoNome.text = contato.nome;
      _controladorCampoEndereco.text = contato.endereco;
      _controladorCampoTelefone.text = contato.telefone;
      _controladorCampoEmail.text = contato.email;
      _controladorCampoCPF.text = contato.cpf;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Contato'),
      ),
      body: ListView(
        children: <Widget>[
          CampoFormularioContato(controlador: _controladorCampoNome, rotulo: 'Nome'),
          CampoFormularioContato(controlador: _controladorCampoEndereco, rotulo: 'Endereço'),
          CampoFormularioContato(controlador: _controladorCampoTelefone, rotulo: 'Telefone'),
          CampoFormularioContato(controlador: _controladorCampoEmail, rotulo: 'E-mail'),
          CampoFormularioContato(controlador: _controladorCampoCPF, rotulo: 'CPF'),
          ElevatedButton(
            child: Text('Confirmar'),
            onPressed: () {
              final String nome = _controladorCampoNome.text;
              final String endereco = _controladorCampoEndereco.text;
              final String telefone = _controladorCampoTelefone.text;
              final String email = _controladorCampoEmail.text;
              final String cpf = _controladorCampoCPF.text;

              final Contato novoContato = Contato(nome, endereco, telefone, email, cpf);
              Navigator.pop(context, novoContato);
            },
          ),
        ],
      ),
    );
  }
}


class CampoFormularioContato extends StatelessWidget {
  final TextEditingController? controlador;
  final String? rotulo;

  CampoFormularioContato({this.controlador, this.rotulo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(
          fontSize: 20.0,
        ),
        decoration: InputDecoration(
          labelText: rotulo,
        ),
        keyboardType: TextInputType.text,
      ),
    );
  }
}

class ListaContatos extends StatefulWidget {
  final List<Contato> _contatos = [];

  @override
  State<StatefulWidget> createState() {
    return ListaContatosState();
  }
}


class ListaContatosState extends State<ListaContatos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(
          'Contatos',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: widget._contatos.length,
        itemBuilder: (context, indice){
          final contato = widget._contatos[indice];
          return ItemContato(contato);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan,
        onPressed: () {
          final Future<Contato?> future = Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return FormularioContato();
              },
            ),
          );
          future.then(
            (contatoRecebido) {
              debugPrint('chegou no then do future');
              debugPrint('$contatoRecebido');
              if (contatoRecebido != null) {
                setState(() {
                  widget._contatos.add(contatoRecebido);
                });
              }
            },
          );
        },
        child: Icon(
          Icons.add_box,
          color: Colors.white,
        ),
      ),
    );
  }
}

class Contato {
  final String nome;
  final String endereco;
  final String telefone;
  final String email;
  final String cpf;

  Contato(this.nome, this.endereco, this.telefone, this.email, this.cpf);
}

class ItemContato extends StatelessWidget {
  final Contato contato;

  ItemContato(this.contato);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.person),
        title: Text(contato.nome),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Endereço: ${contato.endereco}'),
            Text('Telefone: ${contato.telefone}'),
            Text('E-mail: ${contato.email}'),
            Text('CPF: ${contato.cpf}'),
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FormularioContato(contato: contato),
              ),
            );
          },
        ),
      ),
    );
  }
}




//Lista e Formulario de transferencia
//=======================================================================================================================================

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  FormularioTransferencia({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(
          'Nova Transferência',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Editor(
            controlador: _controladorCampoNumeroConta,
            rotulo: 'Numero da Conta',
            dica: '0000',
          ),
          Editor(
            controlador: _controladorCampoValor,
            rotulo: 'Valor',
            dica: '0.00',
            icone: Icons.monetization_on,
          ),
    ElevatedButton(
      child: Text('Confirmar'),
      style: ElevatedButton.styleFrom(
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0),
        ),
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      ),
      onPressed: () {
        _criaTransferencia(
          context,
          _controladorCampoNumeroConta,
          _controladorCampoValor,
    );
  },
)

        ],
      ),
    );
  }
=======
>>>>>>> 39ee184f88b75e09484f01de07a22a199aa3a448

  void _criaTransferencia(
    BuildContext context,
    controladorCampoNumeroConta,
    controladorCampoValor,
  ) {
    final int? numeroConta = int.tryParse(controladorCampoNumeroConta.text);
    final double? valor = double.tryParse(controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      debugPrint('$transferenciaCriada');
      Navigator.pop(context, transferenciaCriada);
    }
  }
}

class Editor extends StatelessWidget {
  final TextEditingController? controlador;
  final String? rotulo;
  final String? dica;
  final IconData? icone;

  Editor({super.key, this.controlador, this.rotulo, this.dica, this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(
          fontSize: 20.0,
        ),
        decoration: InputDecoration(
          icon: icone != null
              ? Icon(
                  icone,
                  color: Colors.green,
                )
              : null,
          labelText: rotulo,
          hintStyle: TextStyle(color: Colors.grey),
          hintText: dica,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class ListaTransferencias extends StatefulWidget {

  ListaTransferencias({super.key});
  final List<Transferencia> _transferencias = [];
  
  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciaState();
  }
}

class ListaTransferenciaState extends State<ListaTransferencias>{
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
<<<<<<< HEAD
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        backgroundColor: Colors.cyan,
=======
      appBar: AppBar(
        backgroundColor: Colors.blue,
>>>>>>> 39ee184f88b75e09484f01de07a22a199aa3a448
        title: Text(
          'Transferências',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice){
          final transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
<<<<<<< HEAD
        backgroundColor: Colors.cyan,
=======
        backgroundColor: Colors.blue,
>>>>>>> 39ee184f88b75e09484f01de07a22a199aa3a448
        onPressed: () {
          final Future<Transferencia?> future = Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return FormularioTransferencia();
              },
            ),
          );
          future.then(
            (transferenciaRecebida) {
              debugPrint('chegou no then do future');
              debugPrint('$transferenciaRecebida');
              if (transferenciaRecebida != null) {
                setState(() {
                  widget._transferencias.add(transferenciaRecebida);
                });
              }
            },
          );
        },
        child: Icon(
<<<<<<< HEAD
          Icons.add_box,
=======
          Icons.add,
>>>>>>> 39ee184f88b75e09484f01de07a22a199aa3a448
          color: Colors.white,
        ),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia, {super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on, color: Colors.green),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> 39ee184f88b75e09484f01de07a22a199aa3a448
