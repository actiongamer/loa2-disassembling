package away3d.debug
{
   import away3d.entities.Mesh;
   import flash.geom.Vector3D;
   import away3d.materials.ColorMaterial;
   import away3d.tools.commands.Merge;
   import away3d.extrusions.LatheExtrude;
   import away3d.debug.data.TridentLines;
   import away3d.core.base.Geometry;
   
   public class Trident extends Mesh
   {
       
      
      public function Trident(param1:Number = 1000, param2:Boolean = true)
      {
         super(new Geometry(),null);
         buildTrident(Math.abs(param1 == 0?10:Number(param1)),param2);
      }
      
      private function buildTrident(param1:Number, param2:Boolean) : void
      {
         var _loc23_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc27_:Number = NaN;
         var _loc24_:Number = param1 * 0.9;
         var _loc26_:* = 2.4;
         var _loc14_:Number = param1 * 0.025;
         var _loc22_:Vector.<Vector.<Vector3D>> = new Vector.<Vector.<Vector3D>>();
         var _loc17_:Vector.<uint> = Vector.<uint>([16711680,65280,255]);
         var _loc13_:ColorMaterial = new ColorMaterial(16711680);
         var _loc15_:ColorMaterial = new ColorMaterial(65280);
         var _loc16_:ColorMaterial = new ColorMaterial(255);
         var _loc21_:ColorMaterial = new ColorMaterial(13421772);
         var _loc7_:Merge = new Merge(true,true);
         var _loc12_:Vector.<Vector3D> = new Vector.<Vector3D>();
         _loc12_[0] = new Vector3D(param1,0,0);
         _loc12_[1] = new Vector3D(_loc24_,0,_loc14_);
         _loc12_[2] = new Vector3D(_loc24_,0,-_loc26_);
         _loc22_[0] = Vector.<Vector3D>([new Vector3D(0,0,0),new Vector3D(_loc24_,0,0)]);
         var _loc25_:LatheExtrude = new LatheExtrude(_loc13_,_loc12_,"x",1,10);
         var _loc4_:Vector.<Vector3D> = new Vector.<Vector3D>();
         _loc4_[0] = new Vector3D(0,param1,0);
         _loc4_[1] = new Vector3D(_loc14_,_loc24_,0);
         _loc4_[2] = new Vector3D(-_loc26_,_loc24_,0);
         _loc22_[1] = Vector.<Vector3D>([new Vector3D(0,0,0),new Vector3D(0,_loc24_,0)]);
         var _loc18_:LatheExtrude = new LatheExtrude(_loc15_,_loc4_,"y",1,10);
         var _loc5_:Vector.<Vector3D> = new Vector.<Vector3D>();
         _loc22_[2] = Vector.<Vector3D>([new Vector3D(0,0,0),new Vector3D(0,0,_loc24_)]);
         _loc5_[0] = new Vector3D(0,_loc26_,_loc24_);
         _loc5_[1] = new Vector3D(0,_loc14_,_loc24_);
         _loc5_[2] = new Vector3D(0,0,param1);
         var _loc19_:LatheExtrude = new LatheExtrude(_loc16_,_loc5_,"z",1,10);
         var _loc11_:Vector.<Vector3D> = new Vector.<Vector3D>();
         _loc11_[0] = new Vector3D(0,_loc26_,0);
         _loc11_[1] = new Vector3D(-(_loc26_ * 0.7),_loc26_ * 0.7,0);
         _loc11_[2] = new Vector3D(-_loc26_,0,0);
         _loc11_[3] = new Vector3D(-(_loc26_ * 0.7),-(_loc26_ * 0.7),0);
         _loc11_[4] = new Vector3D(0,-_loc26_,0);
         var _loc20_:LatheExtrude = new LatheExtrude(_loc21_,_loc11_,"y",1,10);
         _loc7_.applyToMeshes(this,Vector.<Mesh>([_loc25_,_loc18_,_loc19_,_loc20_]));
         if(param2)
         {
            _loc23_ = param1 / 10;
            _loc6_ = param1 / 20;
            _loc10_ = _loc6_ * 1.5;
            _loc8_ = _loc23_ * 3;
            _loc9_ = _loc23_ * 2;
            _loc3_ = _loc23_ * 3.4;
            _loc27_ = param1 + _loc9_ + (param1 + _loc3_ - (param1 + _loc9_)) / 3 * 2;
            _loc22_[3] = Vector.<Vector3D>([new Vector3D(param1 + _loc8_,_loc10_,0),new Vector3D(param1 + _loc9_,-_loc10_,0),new Vector3D(param1 + _loc9_,_loc10_,0),new Vector3D(param1 + _loc8_,-_loc10_,0)]);
            _loc22_[4] = Vector.<Vector3D>([new Vector3D(-_loc6_ * 1.2,param1 + _loc3_,0),new Vector3D(0,_loc27_,0),new Vector3D(_loc6_ * 1.2,param1 + _loc3_,0),new Vector3D(0,_loc27_,0),new Vector3D(0,_loc27_,0),new Vector3D(0,param1 + _loc9_,0)]);
            _loc22_[5] = Vector.<Vector3D>([new Vector3D(0,_loc10_,param1 + _loc8_),new Vector3D(0,_loc10_,param1 + _loc9_),new Vector3D(0,-_loc10_,param1 + _loc8_),new Vector3D(0,-_loc10_,param1 + _loc9_),new Vector3D(0,-_loc10_,param1 + _loc9_),new Vector3D(0,_loc10_,param1 + _loc8_)]);
            _loc17_.push(16711680,65280,255);
         }
         this.addChild(new TridentLines(_loc22_,_loc17_));
      }
   }
}
