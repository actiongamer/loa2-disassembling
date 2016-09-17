package nslm2.mgrs.uiFades
{
   import com.mz.core.utils2.task.TaskBase;
   import flash.display.DisplayObject;
   import nslm2.mgrs.stcMgrs.vos.StcUiFadeVo;
   import nslm2.mgrs.stcMgrs.vos.StcFadeVo;
   import com.greensock.TweenLite;
   import morn.core.utils.ObjectUtils;
   import flash.utils.Dictionary;
   import morn.core.components.List;
   import morn.core.components.Component;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.StcLackFatal;
   
   public class CompFadeTask extends TaskBase
   {
       
      
      private var uiFadeVo:StcUiFadeVo;
      
      private var fadeVo:StcFadeVo;
      
      public var isFadeIn:Boolean;
      
      public var startDelay:Number;
      
      private var oriDataAll:Dictionary;
      
      public function CompFadeTask(param1:DisplayObject, param2:StcUiFadeVo, param3:Boolean, param4:Number = 0)
      {
         super(param1);
         this.uiFadeVo = param2;
         this.fadeVo = StcMgr.ins.getFadeVo(uiFadeVo.fade_id);
         if(this.fadeVo == null)
         {
            new StcLackFatal(this,"static_fade",uiFadeVo.fade_id);
         }
         this.isFadeIn = param3;
         this.startDelay = param4;
      }
      
      public function get comp() : DisplayObject
      {
         return this.tag as DisplayObject;
      }
      
      override public function exec() : void
      {
         var _loc6_:* = undefined;
         var _loc2_:Number = NaN;
         var _loc4_:* = null;
         var _loc11_:* = null;
         var _loc9_:* = null;
         var _loc10_:int = 0;
         var _loc7_:Number = NaN;
         var _loc12_:int = 0;
         var _loc1_:* = null;
         var _loc5_:Number = NaN;
         super.exec();
         if(this.fadeVo == null)
         {
            this.onComplete();
            return;
         }
         var _loc3_:Function = !!this.isFadeIn?TweenLite.from:TweenLite.to;
         var _loc8_:Number = uiFadeVo.delay / 1000 + startDelay;
         if(ObjectUtils.isNone(fadeVo.ease) == false)
         {
            _loc6_ = TweenEaseConsts.getEaseByStr(fadeVo.ease);
         }
         if(uiFadeVo.time > 0)
         {
            _loc2_ = uiFadeVo.time / 1000;
         }
         else
         {
            _loc2_ = fadeVo.time / 1000;
         }
         this.oriDataAll = new Dictionary();
         loop1:
         switch(int(fadeVo.kind) - 1)
         {
            case 0:
               _loc4_ = {};
               oriDataAll[comp] = {};
               _loc11_ = {};
               if(_loc6_)
               {
                  _loc11_.ease = _loc6_;
               }
               if(_loc8_)
               {
                  _loc11_.delay = _loc8_;
               }
               _loc11_.onComplete = tween_onCpl;
               countTweenLiteVars(comp,this.fadeVo,_loc4_,_loc11_);
               _loc4_["tl"] = _loc3_(this.comp,_loc2_,_loc11_);
               break;
            case 1:
               _loc9_ = comp as List;
               if(_loc9_.array != null && _loc9_.array.length != 0)
               {
                  _loc10_ = Math.min(_loc9_.cells.length,_loc9_.array.length);
               }
               else
               {
                  this.onComplete();
               }
               if(fadeVo.list_offsetDelay < 0)
               {
                  _loc7_ = -fadeVo.list_offsetDelay * (_loc10_ - 1) / 1000 + startDelay;
                  _loc8_ = Math.max(_loc7_,_loc8_);
               }
               _loc12_ = 0;
               while(true)
               {
                  if(_loc12_ >= _loc10_)
                  {
                     break loop1;
                  }
                  _loc4_ = {};
                  _loc1_ = _loc9_.cells[_loc12_];
                  _loc4_ = {};
                  this.oriDataAll[_loc1_] = {};
                  _loc11_ = {};
                  if(_loc6_)
                  {
                     _loc11_.ease = _loc6_;
                  }
                  _loc5_ = Math.max(0.1,_loc8_ + _loc12_ * fadeVo.list_offsetDelay / 1000);
                  if(_loc5_ > 0)
                  {
                     _loc11_.delay = _loc5_;
                  }
                  if(fadeVo.list_offsetDelay < 0 && _loc12_ == 0 || fadeVo.list_offsetDelay >= 0 && _loc12_ == _loc10_ - 1)
                  {
                     _loc11_.onComplete = tween_onCpl;
                  }
                  countTweenLiteVars(_loc1_,this.fadeVo,_loc4_,_loc11_);
                  _loc4_["tl"] = _loc3_(_loc1_,_loc2_,_loc11_);
                  _loc12_++;
               }
         }
      }
      
      private function countTweenLiteVars(param1:DisplayObject, param2:StcFadeVo, param3:Object, param4:Object) : void
      {
         if(fadeVo.offset_x != 0)
         {
            param3["x"] = param1.x;
            param4.x = param1.x + fadeVo.offset_x;
         }
         if(fadeVo.offset_y != 0)
         {
            param3["y"] = param1.y;
            param4.y = param1.y + fadeVo.offset_y;
         }
         var _loc6_:Number = fadeVo.alpha;
         if(isNaN(_loc6_) == false && param1.alpha != _loc6_)
         {
            param3["alpha"] = param1.alpha;
            param4.alpha = _loc6_;
         }
         var _loc7_:Number = fadeVo.scale_x;
         if(isNaN(_loc7_) == false && param1.scaleX != _loc7_)
         {
            param3["scaleX"] = param1.scaleX;
            param4.scaleX = _loc7_;
         }
         var _loc5_:Number = fadeVo.scale_y;
         if(isNaN(_loc5_) == false && param1.scaleY != _loc5_)
         {
            param3["scaleY"] = param1.scaleY;
            param4.scaleY = _loc5_;
         }
         param4.overwrite = 0;
      }
      
      private function tween_onCpl() : void
      {
         resetOriAndStop();
         this.onComplete();
      }
      
      public function resetOriAndStop() : void
      {
         if(oriDataAll)
         {
            var _loc3_:int = 0;
            var _loc2_:* = this.oriDataAll;
            for(var _loc1_ in this.oriDataAll)
            {
               resetOriComp(_loc1_,oriDataAll[_loc1_]);
            }
            oriDataAll = null;
         }
      }
      
      private function resetOriComp(param1:DisplayObject, param2:Object) : void
      {
         var _loc3_:* = null;
         var _loc7_:int = 0;
         var _loc4_:* = null;
         _loc3_ = param2["tl"];
         _loc3_.kill();
         var _loc6_:Array = ["x","y","alpha","scaleX","scaleY"];
         var _loc5_:int = _loc6_.length;
         _loc7_ = 0;
         while(_loc7_ < _loc5_)
         {
            _loc4_ = _loc6_[_loc7_];
            if(param2.hasOwnProperty(_loc4_))
            {
               param1[_loc4_] = param2[_loc4_];
            }
            _loc7_++;
         }
      }
   }
}
