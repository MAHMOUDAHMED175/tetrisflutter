

import 'dart:async';

import 'package:flutter/material.dart';

import '../../viewmodel/logic.dart';
import '../../viewmodel/properities_shape.dart';
import '../widget/pixels.dart';

class Gaaaame extends StatefulWidget {
  const Gaaaame({super.key});

  @override
  State<Gaaaame> createState() => _GaaaameState();
}

class _GaaaameState extends State<Gaaaame> {

  @override
  void initState() {
    super.initState();
    // start game when app start
    startGame();

  }
  void startGame(){
    currentPiece.intializePiece();
    Duration frameRate= const Duration(seconds: 1);
    gameLoop(frameRate);
  }
  void gameLoop(Duration frameRate){

    Timer.periodic(
        frameRate,
            (timer) {
          setState(() {
            //clear lines
            clearLine();
            //check landing
            checkLadning();
            // check if game is over
            if(gameOver==true){
              timer.cancel();
              showGameOverMessageDialog();
            }
            //move currentPieceDown
            currentPiece.movePiece(Direction.down);
          });
        }
    );
  }

  void showGameOverMessageDialog(){
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0), // Change the border radius as desired
          ),
          title: const Text(
            'GAME OVER',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30
            ),),
          content: Container(
            width: double.minPositive, // Adjust the width as desired
            child: Text(
              '\nYour score is : $currentScore',
              style: const TextStyle(
                  fontSize: 20
              ),
            ),
          ),
          actions: [
            // to reset the game
            TextButton(
                onPressed:(){
                  resetGame();
                  Navigator.pop(context);
                },
                child: const Text('Play Again',
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 20
                  ),)
            )
          ],
        )
    );
  }
  void resetGame(){
    gameBoard=List.generate(
        columnLength,
            (i) => List.generate(
          rowLength,
              (j)=> null,
        )
    );
    // new game
    currentScore=0;
    gameOver=false;

    createNewPiece();
    startGame();
  }

  // move piece
  void moveLeft(){

    //make sure the piece of valid before moving
    if(!checkCollision(Direction.left )){
      setState((){
        currentPiece.movePiece(Direction.left);
      });
    }
  }
  void moveRight(){
    //make sure the piece of valid before moving
    if(!checkCollision(Direction.right )){
      setState((){
        currentPiece.movePiece(Direction.right);
      });
    }
  }

  void moveUp(){
    //make sure the piece of valid before moving
    if(!checkCollision(Direction.right )){
      setState((){
        currentPiece.movePiece(Direction.up);
      });
    }
  } void moveDown(){
    //make sure the piece of valid before moving
    if(!checkCollision(Direction.right )){
      setState((){
        currentPiece.movePiece(Direction.down);
      });
    }
  }

  void rotatePiece(){
    setState(() {
      currentPiece.rotatePiece();
    });
  }




  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [



          Builder(builder: (BuildContext context) {
            if(MediaQuery.of(context).size.width.toInt()<=580) {
              // علشان اعمل responsive  بين ال screens وعلشان لو عايز اغير الداتا جوااسكرين فى حاله الموبايل بالنسبه للويب والعكس صحيح
              return Expanded(
                  child: GridView.builder(
                      itemCount: rowLength*columnLength,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: rowLength
                      ),
                      itemBuilder: (context, index) {
                        //get row and column for each piece
                        int row = (index / rowLength).floor();
                        int column = index % rowLength;

                        if(currentPiece.position.contains(index)){
                          return  Pixels(
                            color: currentPiece.color,
                          );
                        }
                        else if(gameBoard[row][column] !=null){
                          TetrisComponentShapes? tetrominoShape=gameBoard[row][column];
                          return Pixels(
                            color: tetrisColor[tetrominoShape],
                          );
                        }
                        //landed pieces
                        else{
                          return  Pixels(
                            color: Colors.grey[900],

                          );
                        }

                      }
                  ),
                );

            }
            return Expanded(
              child: SizedBox(
                width: 300,
                height: 250,
                child: GridView.builder(
                    itemCount: rowLength*columnLength,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: rowLength
                    ),
                    itemBuilder: (context, index) {
                      //get row and column for each piece
                      int row = (index / rowLength).floor();
                      int column = index % rowLength;

                      if(currentPiece.position.contains(index)){
                        return  Pixels(
                          color: currentPiece.color,
                        );
                      }
                      else if(gameBoard[row][column] !=null){
                        TetrisComponentShapes? tetrominoShape=gameBoard[row][column];
                        return Pixels(
                          color: tetrisColor[tetrominoShape],
                        );
                      }
                      //landed pieces
                      else{
                        return  Pixels(
                          color: Colors.grey[900],

                        );
                      }

                    }
                ),
              ),
            );
          },),





          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                InkWell(
                  onTap: (){
                    moveDown();
                  },
                  child:Container(
                    height: 40,
                    width: MediaQuery.sizeOf(context).width/5,
                    decoration:  BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Icon(Icons.arrow_downward,color: Colors.black,size: 25,),
                  ) ,
                ),

                Row(
                  children: [
                    const Text(
                      'Score :',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 20
                      ),
                    ),
                    Text(
                      ' $currentScore',
                      style: const TextStyle(
                          color: Colors.greenAccent,
                          fontSize: 20
                      ),
                    ),
                  ],
                ),

                InkWell(
                  onTap: (){
                    moveUp();
                  },
                  child:Container(  height: 40,
                    width: MediaQuery.sizeOf(context).width/5,
                    decoration:  BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Icon(Icons.arrow_upward,color: Colors.black,size: 25,),
                  ) ,
                ),
              ],
            ),
          ),
          // GAME CONTROL
          Padding(
            padding: const EdgeInsets.only(
                bottom: 40,
                top: 20
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //left
                InkWell(
                  onTap: (){
                    moveLeft();
                  },
                  child:Container(  height: 50,
                    width: MediaQuery.sizeOf(context).width/4,
                    decoration:  BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Icon(Icons.arrow_back_outlined,color: Colors.black,size: 25,),
                  ) ,
                ),
                InkWell(
                  onTap: (){
                    rotatePiece();
                  },
                  child:Container(  height: 50,
                    width: MediaQuery.sizeOf(context).width/4,
                    decoration:  BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Icon(Icons.rotate_right_rounded,color: Colors.black,size: 25,),
                  ) ,
                ),
                InkWell(
                  onTap: (){
                    moveRight();
                  },
                  child:Container(  height: 50,
                    width: MediaQuery.sizeOf(context).width/4,
                    decoration:  BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Icon(Icons.arrow_forward,color: Colors.black,size: 25,),
                  ) ,
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
