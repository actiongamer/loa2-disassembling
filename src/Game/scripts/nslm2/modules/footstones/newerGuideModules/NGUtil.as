package nslm2.modules.footstones.newerGuideModules
{
   import morn.core.components.Component;
   import nslm2.mgrs.stcMgrs.vos.StcGuideVo;
   import flash.geom.Point;
   import flash.display.DisplayObjectContainer;
   import morn.core.components.List;
   import com.mz.core.logging.Log;
   import morn.core.components.Group;
   import flash.display.DisplayObject;
   import nslm2.modules.footstones.newerGuideModules.comps.NgBlackCoverScene3D;
   
   public class NGUtil
   {
      
      static var ref:NewerGuideModule;
      
      private static var tempFuncList:Object = {};
       
      
      public function NGUtil()
      {
         super();
      }
      
      public static function regTempFunc(param1:int, param2:Component) : void
      {
         tempFuncList[param1] = param2;
      }
      
      public static function skipAll() : void
      {
         if(ref)
         {
            ref.uiSkipHandler();
         }
      }
      
      public static function unregTempFunc(param1:int) : void
      {
      }
      
      public static function getTempFunc(param1:int) : Component
      {
         return tempFuncList[param1];
      }
      
      public static function get isShowLock() : Boolean
      {
         if(ref)
         {
            return ref.isShowLock;
         }
         return false;
      }
      
      public static function get isShow() : Boolean
      {
         if(ref)
         {
            return ref.isShow;
         }
         return false;
      }
      
      public static function setNotShow() : void
      {
         if(ref)
         {
            ref.setNotShow();
         }
      }
      
      public static function isCurGuideId(param1:int) : Boolean
      {
         if(ref)
         {
            return ref.isCurGuideId(param1);
         }
         return false;
      }
      
      public static function hasCurGuideId(param1:Array) : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:int = param1.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            if(isCurGuideId(param1[_loc3_]))
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      public static function get curStcVo() : StcGuideVo
      {
         if(ref)
         {
            return ref.curStcVo;
         }
         return null;
      }
      
      public static function isOverWait() : Boolean
      {
         if(ref)
         {
            return ref.isOverWait();
         }
         return false;
      }
      
      public static function isCurFuncId(param1:int, param2:Boolean = false) : Boolean
      {
         if(ref)
         {
            return ref.isCurFuncId(param1,param2);
         }
         return false;
      }
      
      public static function changeScene() : void
      {
         if(ref)
         {
            return ref.changeScene();
         }
      }
      
      public static function checkNewStcItemId(param1:int) : void
      {
         if(ref)
         {
            ref.checkNewStcItemId(param1);
         }
      }
      
      public static function checkRuneNg(param1:Boolean, param2:Boolean) : void
      {
         if(ref)
         {
            ref.checkRuneNg(param1,param2);
         }
      }
      
      public static function chapterCpl(param1:int) : void
      {
         if(ref)
         {
            ref.chapterCpl(param1);
         }
      }
      
      public static function levelUp(param1:int) : void
      {
         if(ref)
         {
            ref.levelUp(param1);
         }
      }
      
      public static function levelUpWinClose(param1:int) : void
      {
         if(ref)
         {
            ref.levelUpWinClose(param1);
         }
      }
      
      public static function checkModuleShow(param1:int, param2:Component = null, param3:Boolean = true) : Boolean
      {
         if(ref)
         {
            return ref.checkModuleShow(param1,param2,param3);
         }
         return false;
      }
      
      public static function checkOtherModuleShow() : Boolean
      {
         if(ref)
         {
            var _loc3_:int = 0;
            var _loc2_:* = NGConsts.NEED_CHECK_OTHER_MODULE_SHOW;
            for each(var _loc1_ in NGConsts.NEED_CHECK_OTHER_MODULE_SHOW)
            {
               if(checkModuleShow(_loc1_) == true)
               {
                  return true;
               }
            }
            return false;
         }
         return false;
      }
      
      public static function checkCpl(param1:int) : void
      {
         if(ref)
         {
            ref.checkCpl(param1);
         }
      }
      
      public static function checkModuleHide(param1:int) : void
      {
         if(ref)
         {
            ref.checkModuleHide(param1);
         }
      }
      
      public static function setArrowPos(param1:Point, param2:Point) : void
      {
         if(ref)
         {
            ref.setArrowPos(param1,param2);
         }
      }
      
      public static function changeArrowPos(param1:Point, param2:Point) : void
      {
         if(ref)
         {
            ref.changeArrowPos(param1,param2);
         }
      }
      
      public static function addDone(param1:int) : void
      {
         if(ref)
         {
            ref.addDone(param1);
         }
      }
      
      public static function checkHasDone(param1:int) : Boolean
      {
         if(ref)
         {
            return ref.checkHasDone(param1);
         }
         return false;
      }
      
      public static function removeWait(param1:int) : void
      {
         if(ref)
         {
            ref.removeWait(param1);
         }
      }
      
      public static function findNgCpl() : void
      {
         if(ref)
         {
            ref.findNgCpl();
         }
      }
      
      public static function gm_gotoId(param1:int) : void
      {
         ref.gm_gotoId(param1);
      }
      
      public static function initAfterFirstBattle() : void
      {
         if(ref)
         {
            ref.initAfterFirstBattle();
         }
      }
      
      public static function getCompById(param1:DisplayObjectContainer, param2:String, param3:StcGuideVo) : Component
      {
         var _loc8_:* = null;
         var _loc9_:int = 0;
         var _loc12_:int = 0;
         var _loc4_:* = null;
         var _loc6_:Array = param2.split(".");
         var _loc11_:String = _loc6_.shift();
         var _loc7_:Array = _loc11_.split(":");
         var _loc5_:int = _loc7_.length > 1?_loc7_[1]:-1;
         var _loc10_:String = _loc7_[0];
         if(param1.hasOwnProperty(_loc10_) && param1[_loc10_] is Component)
         {
            _loc8_ = param1[_loc10_];
            if(_loc5_ > -1)
            {
               if(_loc8_ is List)
               {
                  if(_loc5_ >= (_loc8_ as List).cells.length)
                  {
                     Log.fatal(NGUtil,"超出索引","$varIndex:",_loc5_,"($comp as List).cells",(_loc8_ as List).cells.length);
                  }
                  else
                  {
                     _loc8_ = (_loc8_ as List).cells[_loc5_];
                  }
               }
               else if(_loc8_ is Group)
               {
                  if(_loc5_ >= (_loc8_ as Group).items.length)
                  {
                     Log.fatal(NGUtil,"超出索引","$varIndex:",_loc5_,"group items.length",(_loc8_ as Group).items.length);
                  }
                  else
                  {
                     _loc8_ = (_loc8_ as Group).items[_loc5_] as Component;
                  }
               }
               else
               {
                  Log.fatal(NGUtil,"getCompById $compIndex有值,但$comp不是List也不是Group");
               }
            }
            if(_loc6_.length > 0)
            {
               if(_loc8_ is INewerGuideGetComp)
               {
                  return (_loc8_ as INewerGuideGetComp).getCompById(_loc6_.join("."),param3);
               }
               return getCompById(_loc8_,_loc6_.join("."),param3);
            }
            return _loc8_;
         }
         if(param1.numChildren)
         {
            _loc9_ = param1.numChildren;
            _loc12_ = _loc9_ - 1;
            while(_loc12_ >= 0)
            {
               _loc4_ = param1.getChildAt(_loc12_);
               if(_loc4_ is DisplayObjectContainer)
               {
                  if(_loc4_ is INewerGuideGetComp)
                  {
                     _loc8_ = (_loc4_ as INewerGuideGetComp).getCompById(param2,param3);
                  }
                  else
                  {
                     _loc8_ = getCompById(_loc4_ as DisplayObjectContainer,param2,param3);
                  }
                  if(_loc8_)
                  {
                     return _loc8_;
                  }
               }
               _loc12_--;
            }
         }
         return null;
      }
      
      public static function switchBlackCoverScene3D(param1:Boolean) : void
      {
         if(ref)
         {
            NgBlackCoverScene3D.ins.switchState(param1);
         }
      }
      
      public static function getRef() : NewerGuideModule
      {
         return ref;
      }
   }
}
