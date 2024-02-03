package com.jocarsa.paresonones

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.RadioButton
import android.widget.RadioGroup
import android.widget.TextView
import kotlin.random.Random

class MainActivity : AppCompatActivity() {

    private lateinit var radioGroup:RadioGroup
    private lateinit var lanzarboton:Button
    private lateinit var resultadolinea1:TextView
    private lateinit var resultadolinea2:TextView
    private lateinit var numeroelegido:EditText

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        radioGroup = findViewById(R.id.radioGroup)
        lanzarboton = findViewById(R.id.botonlanzar)
        resultadolinea1 = findViewById(R.id.resultadolinea1)
        resultadolinea2 = findViewById(R.id.resultadolinea2)
        numeroelegido = findViewById(R.id.minumero)

        lanzarboton.setOnClickListener{
            clickBotonLanzar()
        }



    }
    private fun  clickBotonLanzar(){
        val seleccionado = radioGroup.checkedRadioButtonId
        if(seleccionado != -1){
            val radioseleccionado = findViewById<RadioButton>(seleccionado)
            val valorseleccionado = radioseleccionado.text.toString()
            var numeroseleccionado = numeroelegido.text.toString()
            val numerodelamaquina = Random.nextInt(10)

            resultadolinea1.text = "Numero de la maquina: $numerodelamaquina"

            val total = numeroseleccionado.toInt() + numerodelamaquina.toInt()
            if(total%2 == 0 && valorseleccionado == "Pares" || total%2 != 0 && valorseleccionado == "Nones"){
                resultadolinea2.text = "El jugador gana"
            }else{
                resultadolinea2.text = "La máquina gana"
            }

        }

    }
}