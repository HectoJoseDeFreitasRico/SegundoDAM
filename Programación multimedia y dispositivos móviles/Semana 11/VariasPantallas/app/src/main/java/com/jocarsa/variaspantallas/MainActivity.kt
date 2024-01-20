package com.jocarsa.variaspantallas

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        //Primero selecciono el boton
        val miboton: Button = findViewById(R.id.miboton)

        //Primero selecciono el boton
        val mibotonpantalla3: Button = findViewById(R.id.mibotonpantalla3)

        //Voy a añadir un escuchador para el click
        miboton.setOnClickListener{
            var edad:Int = 75
           // Toast.makeText(applicationContext,"edad"+edad,Toast.LENGTH_SHORT).show()
            //Ahora voy a lanzar una actividad 2 desde la actividad 1
            val intent = Intent(this@MainActivity,MainActivity2::class.java)
            intent.putExtra("edad",edad.toString())
            startActivity(intent)
        }

        mibotonpantalla3.setOnClickListener{
            var edad:Int = 85
            // Toast.makeText(applicationContext,"edad"+edad,Toast.LENGTH_SHORT).show()
            //Ahora voy a lanzar una actividad 2 desde la actividad 1
            val intent = Intent(this@MainActivity,MainActivity3::class.java)
            intent.putExtra("edad",edad.toString())
            startActivity(intent)
        }

    }
}