package org.specter3d.debug
{
   import org.specter3d.display.Specter3D;
   import away3d.primitives.WireframePlane;
   import away3d.debug.Trident;
   
   public class SpecterDebugAxesGrid extends Specter3D
   {
       
      
      private var _color:Number;
      
      private var _cols:Number;
      
      private var _gridH:Number;
      
      private var _gridPlane:WireframePlane;
      
      private var _gridSize:Number;
      
      private var _gridW:Number;
      
      private var _rows:Number;
      
      private var _trident:Trident;
      
      public function SpecterDebugAxesGrid(param1:Number, param2:Number, param3:Number, param4:uint = 16777215)
      {
         super(null);
         _rows = param1;
         _cols = param2;
         _gridSize = param3;
         _color = param4;
         initView();
      }
      
      public function get tridentObject() : Trident
      {
         return _trident;
      }
      
      private function initView() : void
      {
         this._trident = new Trident(200);
         addChild(this._trident);
         _gridW = _rows * _gridSize;
         _gridH = _cols * _gridSize;
         _gridPlane = new WireframePlane(_gridW,_gridH,_rows,_cols,_color,1,"xz");
         addChild(_gridPlane);
      }
   }
}
