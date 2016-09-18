package org.specter3d.configs.particle.node
{
   import org.specter3d.configs.particle.BaseData;
   import flash.geom.ColorTransform;
   import org.specter3d.utils.Color;
   
   public class ColorData extends BaseData
   {
      
      public static const COLOR_DATA_START_MU:String = "start_mu";
      
      public static const COLOR_DATA_START_OFFSET:String = "start_offset";
      
      public static const COLOR_DATA_END_MU:String = "end_mu";
      
      public static const COLOR_DATA_END_OFFSET:String = "end_offset";
      
      public static const COLOR_DATA_SEG_ONE_MU:String = "seg_one_mu";
      
      public static const COLOR_DATA_SEG_ONE_OFFSET:String = "seg_one_offset";
      
      public static const COLOR_DATA_SEG_TWO_MU:String = "seg_two_mu";
      
      public static const COLOR_DATA_SEG_TWO_OFFSET:String = "seg_two_offset";
       
      
      private var _usesMultiplier:Boolean = true;
      
      private var _usesOffset:Boolean = true;
      
      public var usesCycle:Boolean = false;
      
      public var usesPhase:Boolean = false;
      
      public var cycleDuration:Number = 1;
      
      public var cyclePhase:Number = 0;
      
      public var segmentOneTime:Number = 0;
      
      public var segmentTwoTime:Number = 0;
      
      private var _colorVec:Vector.<ColorTransform>;
      
      public function ColorData()
      {
         var _loc2_:int = 0;
         super();
         _colorVec = new Vector.<ColorTransform>(4);
         var _loc1_:int = _colorVec.length;
         _loc2_ = 0;
         while(_loc2_ < _loc1_)
         {
            _colorVec[_loc2_] = new ColorTransform();
            _loc2_++;
         }
      }
      
      public function get srm() : Number
      {
         return _colorVec[0].redMultiplier;
      }
      
      public function set srm(param1:Number) : void
      {
         _colorVec[0].redMultiplier = param1;
      }
      
      public function get sgm() : Number
      {
         return _colorVec[0].greenMultiplier;
      }
      
      public function set sgm(param1:Number) : void
      {
         _colorVec[0].greenMultiplier = param1;
      }
      
      public function get sbm() : Number
      {
         return _colorVec[0].blueMultiplier;
      }
      
      public function set sbm(param1:Number) : void
      {
         _colorVec[0].blueMultiplier = param1;
      }
      
      public function get sam() : Number
      {
         return _colorVec[0].alphaMultiplier;
      }
      
      public function set sam(param1:Number) : void
      {
         _colorVec[0].alphaMultiplier = param1;
      }
      
      public function get sro() : Number
      {
         return _colorVec[0].redOffset;
      }
      
      public function set sro(param1:Number) : void
      {
         _colorVec[0].redOffset = param1;
      }
      
      public function get sgo() : Number
      {
         return _colorVec[0].greenOffset;
      }
      
      public function set sgo(param1:Number) : void
      {
         _colorVec[0].greenOffset = param1;
      }
      
      public function get sbo() : Number
      {
         return _colorVec[0].blueOffset;
      }
      
      public function set sbo(param1:Number) : void
      {
         _colorVec[0].blueOffset = param1;
      }
      
      public function get sao() : Number
      {
         return _colorVec[0].alphaOffset;
      }
      
      public function set sao(param1:Number) : void
      {
         _colorVec[0].alphaOffset = param1;
      }
      
      public function get erm() : Number
      {
         return _colorVec[1].redMultiplier;
      }
      
      public function set erm(param1:Number) : void
      {
         _colorVec[1].redMultiplier = param1;
      }
      
      public function get egm() : Number
      {
         return _colorVec[1].greenMultiplier;
      }
      
      public function set egm(param1:Number) : void
      {
         _colorVec[1].greenMultiplier = param1;
      }
      
      public function get ebm() : Number
      {
         return _colorVec[1].blueMultiplier;
      }
      
      public function set ebm(param1:Number) : void
      {
         _colorVec[1].blueMultiplier = param1;
      }
      
      public function get eam() : Number
      {
         return _colorVec[1].alphaMultiplier;
      }
      
      public function set eam(param1:Number) : void
      {
         _colorVec[1].alphaMultiplier = param1;
      }
      
      public function get ero() : Number
      {
         return _colorVec[1].redOffset;
      }
      
      public function set ero(param1:Number) : void
      {
         _colorVec[1].redOffset = param1;
      }
      
      public function get ego() : Number
      {
         return _colorVec[1].greenOffset;
      }
      
      public function set ego(param1:Number) : void
      {
         _colorVec[1].greenOffset = param1;
      }
      
      public function get ebo() : Number
      {
         return _colorVec[1].blueOffset;
      }
      
      public function set ebo(param1:Number) : void
      {
         _colorVec[1].blueOffset = param1;
      }
      
      public function get eao() : Number
      {
         return _colorVec[1].alphaOffset;
      }
      
      public function set eao(param1:Number) : void
      {
         _colorVec[1].alphaOffset = param1;
      }
      
      public function get seg_1_rm() : Number
      {
         return _colorVec[2].redMultiplier;
      }
      
      public function set seg_1_rm(param1:Number) : void
      {
         _colorVec[2].redMultiplier = param1;
      }
      
      public function get seg_1_gm() : Number
      {
         return _colorVec[2].greenMultiplier;
      }
      
      public function set seg_1_gm(param1:Number) : void
      {
         _colorVec[2].greenMultiplier = param1;
      }
      
      public function get seg_1_bm() : Number
      {
         return _colorVec[2].blueMultiplier;
      }
      
      public function set seg_1_bm(param1:Number) : void
      {
         _colorVec[2].blueMultiplier = param1;
      }
      
      public function get seg_1_am() : Number
      {
         return _colorVec[2].alphaMultiplier;
      }
      
      public function set seg_1_am(param1:Number) : void
      {
         _colorVec[2].alphaMultiplier = param1;
      }
      
      public function get seg_1_ro() : Number
      {
         return _colorVec[2].redOffset;
      }
      
      public function set seg_1_ro(param1:Number) : void
      {
         _colorVec[2].redOffset = param1;
      }
      
      public function get seg_1_go() : Number
      {
         return _colorVec[2].greenOffset;
      }
      
      public function set seg_1_go(param1:Number) : void
      {
         _colorVec[2].greenOffset = param1;
      }
      
      public function get seg_1_bo() : Number
      {
         return _colorVec[2].blueOffset;
      }
      
      public function set seg_1_bo(param1:Number) : void
      {
         _colorVec[2].blueOffset = param1;
      }
      
      public function get seg_1_ao() : Number
      {
         return _colorVec[2].alphaOffset;
      }
      
      public function set seg_1_ao(param1:Number) : void
      {
         _colorVec[2].alphaOffset = param1;
      }
      
      public function get seg_2_rm() : Number
      {
         return _colorVec[3].redMultiplier;
      }
      
      public function set seg_2_rm(param1:Number) : void
      {
         _colorVec[3].redMultiplier = param1;
      }
      
      public function get seg_2_gm() : Number
      {
         return _colorVec[3].greenMultiplier;
      }
      
      public function set seg_2_gm(param1:Number) : void
      {
         _colorVec[3].greenMultiplier = param1;
      }
      
      public function get seg_2_bm() : Number
      {
         return _colorVec[3].blueMultiplier;
      }
      
      public function set seg_2_bm(param1:Number) : void
      {
         _colorVec[3].blueMultiplier = param1;
      }
      
      public function get seg_2_am() : Number
      {
         return _colorVec[3].alphaMultiplier;
      }
      
      public function set seg_2_am(param1:Number) : void
      {
         _colorVec[3].alphaMultiplier = param1;
      }
      
      public function get seg_2_ro() : Number
      {
         return _colorVec[3].redOffset;
      }
      
      public function set seg_2_ro(param1:Number) : void
      {
         _colorVec[3].redOffset = param1;
      }
      
      public function get seg_2_go() : Number
      {
         return _colorVec[3].greenOffset;
      }
      
      public function set seg_2_go(param1:Number) : void
      {
         _colorVec[3].greenOffset = param1;
      }
      
      public function get seg_2_bo() : Number
      {
         return _colorVec[3].blueOffset;
      }
      
      public function set seg_2_bo(param1:Number) : void
      {
         _colorVec[3].blueOffset = param1;
      }
      
      public function get seg_2_ao() : Number
      {
         return _colorVec[3].alphaOffset;
      }
      
      public function set seg_2_ao(param1:Number) : void
      {
         _colorVec[3].alphaOffset = param1;
      }
      
      public function get segmentNum() : int
      {
         if(segmentOneTime == 0)
         {
            return 0;
         }
         if(segmentTwoTime == 0)
         {
            return 1;
         }
         return 2;
      }
      
      public function get usesOffset() : Boolean
      {
         return _usesOffset;
      }
      
      public function set usesOffset(param1:Boolean) : void
      {
      }
      
      public function get usesMultiplier() : Boolean
      {
         return _usesMultiplier;
      }
      
      public function set usesMultiplier(param1:Boolean) : void
      {
      }
      
      public function setColor(param1:String, param2:uint, param3:Number) : void
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:* = param1;
         if("start_mu" !== _loc6_)
         {
            if("start_offset" !== _loc6_)
            {
               if("end_mu" !== _loc6_)
               {
                  if("end_offset" !== _loc6_)
                  {
                     if("seg_one_mu" !== _loc6_)
                     {
                        if("seg_one_offset" !== _loc6_)
                        {
                           if("seg_two_mu" !== _loc6_)
                           {
                              if("seg_two_offset" === _loc6_)
                              {
                                 _loc4_ = _colorVec[3];
                                 _loc5_ = 1;
                              }
                           }
                           else
                           {
                              _loc4_ = _colorVec[3];
                              _loc5_ = 0;
                           }
                        }
                        else
                        {
                           _loc4_ = _colorVec[2];
                           _loc5_ = 1;
                        }
                     }
                     else
                     {
                        _loc4_ = _colorVec[2];
                        _loc5_ = 0;
                     }
                  }
                  else
                  {
                     _loc4_ = _colorVec[1];
                     _loc5_ = 1;
                  }
               }
               else
               {
                  _loc4_ = _colorVec[1];
                  _loc5_ = 0;
               }
            }
            else
            {
               _loc4_ = _colorVec[0];
               _loc5_ = 1;
            }
         }
         else
         {
            _loc4_ = _colorVec[0];
            _loc5_ = 0;
         }
         if(_loc5_ == 0)
         {
            _loc4_.redMultiplier = Color.GetR(param2) / 255;
            _loc4_.greenMultiplier = Color.GetG(param2) / 255;
            _loc4_.blueMultiplier = Color.GetB(param2) / 255;
            _loc4_.alphaMultiplier = param3;
            updateMultiplier();
         }
         else
         {
            _loc4_.redOffset = Color.GetR(param2);
            _loc4_.greenOffset = Color.GetG(param2);
            _loc4_.blueOffset = Color.GetB(param2);
            _loc4_.alphaOffset = param3;
            updateOffset();
         }
      }
      
      public function updateColorVec(param1:Vector.<ColorTransform>) : void
      {
         _colorVec = param1.concat(null);
         updateMultiplier();
         updateOffset();
      }
      
      private function updateMultiplier() : void
      {
         var _loc1_:* = null;
         var _loc3_:int = 0;
         var _loc2_:int = _colorVec.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = _colorVec[_loc3_];
            _usesMultiplier = _loc1_.redMultiplier != 1 || _loc1_.greenMultiplier != 1 || _loc1_.blueMultiplier != 1 || _loc1_.alphaMultiplier != 1;
            if(!_usesMultiplier)
            {
               _loc3_++;
               continue;
            }
            break;
         }
      }
      
      private function updateOffset() : void
      {
         var _loc1_:* = null;
         var _loc3_:int = 0;
         var _loc2_:int = _colorVec.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = _colorVec[_loc3_];
            _usesOffset = _loc1_.redOffset != 0 || _loc1_.greenOffset != 0 || _loc1_.blueOffset != 0 || _loc1_.alphaOffset != 0;
            if(!_usesOffset)
            {
               _loc3_++;
               continue;
            }
            break;
         }
      }
      
      public function get startColor() : ColorTransform
      {
         var _loc1_:ColorTransform = new ColorTransform();
         _loc1_.concat(_colorVec[0]);
         return _loc1_;
      }
      
      public function get endColor() : ColorTransform
      {
         var _loc1_:ColorTransform = new ColorTransform();
         _loc1_.concat(_colorVec[1]);
         return _loc1_;
      }
      
      public function get segmentOneColor() : ColorTransform
      {
         var _loc1_:ColorTransform = new ColorTransform();
         _loc1_.concat(_colorVec[2]);
         return _loc1_;
      }
      
      public function get segmentTwoColor() : ColorTransform
      {
         var _loc1_:ColorTransform = new ColorTransform();
         _loc1_.concat(_colorVec[3]);
         return _loc1_;
      }
      
      public function getColorValue(param1:int, param2:int) : uint
      {
         var _loc3_:ColorTransform = _colorVec[param1];
         if(param2 == 0)
         {
            return Color.ARGB(_loc3_.alphaMultiplier,_loc3_.redMultiplier * 255,_loc3_.greenMultiplier * 255,_loc3_.blueMultiplier * 255);
         }
         return Color.ARGB(_loc3_.alphaOffset,_loc3_.redOffset,_loc3_.greenOffset,_loc3_.blueOffset);
      }
      
      public function getAlphaValue(param1:int, param2:int) : Number
      {
         var _loc3_:ColorTransform = _colorVec[param1];
         if(param2 == 0)
         {
            return _loc3_.alphaMultiplier;
         }
         return _loc3_.alphaOffset;
      }
      
      override public function clone() : BaseData
      {
         var _loc1_:ColorData = new ColorData();
         _loc1_.usesNode = usesNode;
         _loc1_.cycleDuration = cycleDuration;
         _loc1_.cyclePhase = cyclePhase;
         _loc1_.usesCycle = usesCycle;
         _loc1_.usesNode = usesNode;
         _loc1_.usesPhase = usesPhase;
         _loc1_.updateColorVec(_colorVec);
         return _loc1_;
      }
   }
}
