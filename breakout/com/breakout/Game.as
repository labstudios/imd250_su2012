﻿package com.breakout{	import flash.display.Sprite;	import flash.events.Event;	public class Game extends Sprite	{		public static const TOP_WALL:Number = 0;		public static const BOTTOM_WALL:Number = 400;		public static const LEFT_WALL:Number = 0;		public static const RIGHT_WALL:Number = 550;				private var _ball:Ball;		private var _paddle:Paddle;				public function Game():void		{			this._ball = new Ball(); //creates the ball			this._ball.x = 275;			this._ball.y = 250;						this._paddle = new Paddle();			this._paddle.x = 275;			this._paddle.y = 350;						this.addChild(this._paddle);			this.addChild(this._ball); //makes the ball show up						this.addEventListener(Event.ENTER_FRAME, this.run);		}				private function run(e:* = null):void		{			this._paddle.run();			this._ball.run();		}	}}