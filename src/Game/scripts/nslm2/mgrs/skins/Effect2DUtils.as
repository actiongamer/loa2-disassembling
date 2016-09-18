package nslm2.mgrs.skins
{
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import morn.core.components.Component;
   import nslm2.utils.MM2Util;
   import flash.geom.Point;
   import com.mz.core.utils.ArrayUtil;
   
   public class Effect2DUtils
   {
       
      
      public function Effect2DUtils()
      {
         super();
      }
      
      public static function findOld(param1:Component, param2:int) : BmcSpriteSheet
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc3_:* = undefined;
         if(param1 == null || param1.parts == null)
         {
            return null;
         }
         _loc4_ = param1.parts.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = param1.parts[_loc5_];
            if(_loc3_ is BmcSpriteSheet)
            {
               if((_loc3_ as BmcSpriteSheet).sid == param2)
               {
                  return _loc3_ as BmcSpriteSheet;
               }
            }
            _loc5_++;
         }
         return null;
      }
      
      public static function changeBtnEff(param1:Boolean, param2:Component, param3:int = 0) : BmcSpriteSheet
      {
         if(param3 == 0)
         {
            param3 = MM2Util.getSizeByBtnStyle(param2.style);
            if(param3 == 0)
            {
               param3 = 6;
            }
         }
         if(param1)
         {
            switch(int(param3) - 5)
            {
               case 0:
                  return showBtnEff_btnMiddle(param2);
               case 1:
                  return showBtnEff_btnBig(param2);
               case 2:
                  return showBtnEff_btnBig2(param2);
               case 3:
                  return showBtnEff_btnSmall(param2);
            }
         }
         else
         {
            switch(int(param3) - 5)
            {
               case 0:
                  return hideBtnEff_btnMiddle(param2);
               case 1:
                  return hideBtnEff_btnBig(param2);
               case 2:
                  return hideBtnEff_btnBig2(param2);
               case 3:
                  return hideBtnEff_btnSmall(param2);
            }
         }
         return null;
      }
      
      public static function showBtnEff_btnBig2(param1:Component) : BmcSpriteSheet
      {
         return showEff(param1,115002,new Point(3,-3));
      }
      
      public static function showBtnEff_btnBig(param1:Component) : BmcSpriteSheet
      {
         return showEff(param1,115002,new Point(-8,-10));
      }
      
      public static function showBtnEff_btnMiddle(param1:Component) : BmcSpriteSheet
      {
         return showEff(param1,10000002,new Point(-3,-3));
      }
      
      public static function showBtnEff_btnSmall(param1:Component) : BmcSpriteSheet
      {
         return showEff(param1,10000003,new Point(0,-4));
      }
      
      public static function showEff(param1:Component, param2:int, param3:Point = null) : BmcSpriteSheet
      {
         var _loc4_:BmcSpriteSheet = findOld(param1,param2);
         if(_loc4_ == null)
         {
            _loc4_ = new BmcSpriteSheet();
            _loc4_.init(param2,1,"all",true);
            param1.addChild(_loc4_);
            param1.parts.push(_loc4_);
            if(param3)
            {
               _loc4_.x = param3.x;
               _loc4_.y = param3.y;
            }
         }
         else
         {
            _loc4_.visible = true;
         }
         return _loc4_;
      }
      
      public static function hideBtnEff_btnBig2(param1:Component) : BmcSpriteSheet
      {
         return hideBtnEff_btnBig(param1);
      }
      
      public static function hideBtnEff_btnBig(param1:Component) : BmcSpriteSheet
      {
         return hideEff(param1,115002);
      }
      
      public static function hideBtnEff_btnMiddle(param1:Component) : BmcSpriteSheet
      {
         return hideEff(param1,10000002);
      }
      
      public static function hideBtnEff_btnSmall(param1:Component) : BmcSpriteSheet
      {
         return hideEff(param1,10000003);
      }
      
      public static function hideEff(param1:Component, param2:int) : BmcSpriteSheet
      {
         var _loc3_:BmcSpriteSheet = findOld(param1,param2);
         if(_loc3_ != null)
         {
            _loc3_.visible = false;
         }
         return _loc3_;
      }
      
      public static function disposeEff(param1:Component, param2:int) : void
      {
         var _loc3_:BmcSpriteSheet = findOld(param1,param2);
         if(_loc3_ != null)
         {
            _loc3_.dispose();
            ArrayUtil.removeItem(param1.parts,_loc3_);
         }
      }
   }
}
