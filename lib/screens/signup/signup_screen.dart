import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/screens/signup/components/field_title.dart';
import 'package:xlo_mobx/stores/signup_store.dart';

class SignUpScreen extends StatelessWidget {

  final SignupStore signupStore = SignupStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FieldTitle(
                      title: "Apelido",
                      subtitle: "Como aparecerá em seus anúncios.",
                    ),
                    Observer(builder: (_){
                      return TextField(
                        enabled: !signupStore.loading,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Exemplo João S.",
                          isDense: true,
                          errorText: signupStore.nameError,
                        ),
                        onChanged: signupStore.setName,
                      );
                    }),
                    const SizedBox(height: 16,),
                    FieldTitle(
                      title: "E-mail",
                      subtitle: "Enviaremos um e-mail de confirmação.",
                    ),
                    Observer(builder: (_) {
                      return TextField(
                        enabled: !signupStore.loading,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Exemplo joao@gmail.com",
                            isDense: true,
                            errorText: signupStore.emailError
                        ),
                        onChanged: signupStore.setEmail,
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                      );
                    }),
                    const SizedBox(height: 16,),
                    FieldTitle(
                      title: "Celular",
                      subtitle: "Proteja sua conta.",
                    ),
                    Observer(builder: (_){
                      return TextField(
                        enabled: !signupStore.loading,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "(99) 99999-3333",
                          isDense: true,
                          errorText: signupStore.phoneError,
                        ),
                        onChanged: signupStore.setPhone,
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          WhitelistingTextInputFormatter.digitsOnly,
                          TelefoneInputFormatter(),
                        ],
                      );
                    }),
                    const SizedBox(height: 16,),
                    FieldTitle(
                      title: "Senha",
                      subtitle: "Use letras, números e caracteres especiais.",
                    ),
                    Observer(builder: (_){
                      return TextField(
                        enabled: !signupStore.loading,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: "Senha",
                          isDense: true,
                          errorText: signupStore.pass1Error,
                        ),
                        onChanged: signupStore.setPass1,
                        obscureText: true,
                      );
                    }),
                    const SizedBox(height: 16,),
                    FieldTitle(
                      title: "Confirma Senha",
                      subtitle: "Repita a senha.",
                    ),
                    Observer(builder: (_){
                      return TextField(
                        enabled: !signupStore.loading,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: "Repetir senha",
                          isDense: true,
                          errorText: signupStore.pass2Error,
                        ),
                        onChanged: signupStore.setPass2,
                        obscureText: true,
                      );
                    }),
                    const SizedBox(height: 16,),
                    Observer(builder: (_){
                      return Container(
                        height: 40,
                        margin: const EdgeInsets.symmetric(vertical: 12),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          color: Colors.orange,
                          disabledColor: Colors.orange.withAlpha(120),
                          child: signupStore.loading
                            ? CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                          )
                            : Text('CADASTRAR'),
                          textColor: Colors.white,
                          elevation: 0,
                          onPressed: signupStore.signUpPressed,
                        ),
                      );
                    }),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: <Widget>[
                          const Text(
                            'Já tem uma conta? ',
                            style: TextStyle(fontSize: 16),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Entrar',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.purple,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
