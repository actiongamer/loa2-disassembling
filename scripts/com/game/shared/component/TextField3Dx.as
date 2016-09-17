package com.game.shared.component
{
   import away3d.entities.Sprite3D;
   import flash.filters.DropShadowFilter;
   import away3d.materials.TextureMaterial;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import morn.core.components.Styles;
   import flash.display.BitmapData;
   import nslm2.utils.TransformUtil;
   import away3d.utils.Cast;
   import away3d.textures.BitmapTexture;
   import away3d.tools.utils.TextureUtils;
   
   public class TextField3Dx extends Sprite3D
   {
      
      public static const TEXT_DROP_SHADOW:Array = [new DropShadowFilter(0,45,0,1,2,2,10)];
       
      
      private var _textureMaterial:TextureMaterial;
      
      public var _textField:TextField;
      
      private var _width:Number;
      
      private var _height:Number;
      
      private var _filters:Array;
      
      private var _baseText:String;
      
      private var _text:String;
      
      private var _appendText:String;
      
      public function TextField3Dx(param1:Number = 128, param2:Number = 32, param3:Array = null, param4:String = null)
      {
         _textureMaterial = new TextureMaterial();
         _width = param1;
         _height = param2;
         _filters = param3;
         super(_textureMaterial,param1,param2);
         mouseEnabled = false;
         mouseChildren = false;
      }
      
      public function setText(param1:String = "ross", param2:String = "#32FFFF", param3:int = 12, param4:String = "SimSun", param5:Boolean = false) : void
      {
         _baseText = param1;
         _textField = new TextField();
         _textField.defaultTextFormat = new TextFormat(Styles.fontName,12,0);
         _textField.multiline = true;
         _textField.filters = _filters;
         _textField.width = _width;
         _textField.height = _height;
         if(!param5)
         {
            _text = "<p align=\'center\'><font face=\'" + param4 + "\' color=\'" + param2 + "\' size=\'" + param3 + "\'>" + param1 + "</font></p>";
         }
         else
         {
            _text = "<p align=\'center\'><b><font face=\'" + param4 + "\' color=\'" + param2 + "\' size=\'" + param3 + "\'>" + param1 + "</font></b></p>";
         }
         if(_appendText == null)
         {
            _textField.htmlText = _text;
         }
         else
         {
            _textField.htmlText = "<textformat leading=\'5\'>" + _text + _appendText + "</textformat>";
            _textField.height = _textField.height + _height;
         }
         height = _textField.height;
      }
      
      public function appendText(param1:String = "ross", param2:String = "#32FFFF", param3:int = 12, param4:String = "SimSun", param5:Boolean = false) : void
      {
         if(!param5)
         {
            _appendText = "<p align=\'center\'><font face=\'" + param4 + "\' color=\'" + param2 + "\' size=\'" + param3 + "\'>" + param1 + "</font></p>";
         }
         else
         {
            _appendText = "<p align=\'center\'><b><font face=\'" + param4 + "\' color=\'" + param2 + "\' size=\'" + param3 + "\'>" + param1 + "</font></b></p>";
         }
         _textField.htmlText = "<textformat leading=\'5\'>" + _text + _appendText + "</textformat>";
         _textField.height = _textField.height + _height;
         height = _textField.height;
      }
      
      public function drawBitmap() : void
      {
         var _loc1_:* = null;
         if(_baseText != null)
         {
            _loc1_ = new BitmapData(_textField.width,_textField.height,true,0);
            _loc1_.draw(_textField);
            setBitmapData(_loc1_,true);
         }
      }
      
      public function setBitmapData(param1:BitmapData, param2:Boolean = false) : void
      {
         param1 = TransformUtil.validateBmd(param1,true);
         if(param2)
         {
            this.width = param1.width;
            this.height = param1.height;
         }
         var _loc3_:BitmapTexture = Cast.bitmapTexture(param1);
         _textureMaterial.texture = _loc3_;
         _textureMaterial.blendMode = "layer";
         _textureMaterial.smooth = false;
         _textureMaterial.alphaBlending = true;
      }
      
      override public function set width(param1:Number) : void
      {
         if(TextureUtils.isPowerOfTwo(param1))
         {
            .super.width = param1;
            return;
         }
         .super.width = TextureUtils.getBestPowerOf2(param1);
      }
      
      override public function set height(param1:Number) : void
      {
         if(TextureUtils.isPowerOfTwo(param1))
         {
            .super.height = param1;
            return;
         }
         .super.height = TextureUtils.getBestPowerOf2(param1);
      }
      
      public function clear() : void
      {
         _appendText = null;
         _text = null;
         _height = 32;
         if(_textField != null)
         {
            _textField.text = "";
            _textField.height = _height;
         }
         this.height = _height;
         if(_textureMaterial != null && _textureMaterial.texture != null)
         {
            (_textureMaterial.texture as BitmapTexture).bitmapData.dispose();
            _textureMaterial.texture.dispose();
            _textureMaterial.texture = null;
         }
      }
      
      public function set alpha(param1:Number) : void
      {
         _textureMaterial.alpha = param1;
      }
      
      public function get alpha() : Number
      {
         return _textureMaterial.alpha;
      }
      
      override public function dispose() : void
      {
         clear();
         if(_textureMaterial != null)
         {
            _textureMaterial = null;
         }
         _textField = null;
         super.dispose();
      }
      
      override public function set visible(param1:Boolean) : void
      {
         if(_textureMaterial)
         {
            _textureMaterial.alpha = !!param1?1:0;
         }
         .super.visible = param1;
      }
   }
}
