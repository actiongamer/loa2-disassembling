package nslm2.mgrs
{
   import flash.geom.Point;
   import flash.display.BitmapData;
   import flash.ui.MouseCursorData;
   import flash.ui.Mouse;
   import com.mz.core.utils.DictHash;
   import nslm2.common.vo.MouseCursorVo;
   import nslm2.modules.scenes.commons.IMouseOutObject3D;
   import com.mz.core.mgrs.UIMgr;
   import flash.events.MouseEvent;
   import flash.display.DisplayObject;
   import flash.display.Bitmap;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   
   public class MouseIconManager
   {
      
      public static const AWL:String = "awl";
      
      public static const HAMMER:String = "hammer";
      
      public static const MOUSE_FIGHT:String = "mouseFight";
      
      public static const MOUSE_FIGHT_BIG:String = "mouse_fight_big";
      
      public static const MOUSE_FLAG:String = "mouse_flag";
      
      public static const RESET_EXCEPT_MOUSE:Array = ["awl","hammer"];
      
      private static var _ins:nslm2.mgrs.MouseIconManager;
       
      
      private var specialCursorDic:DictHash;
      
      private var obj3d:IMouseOutObject3D;
      
      private var crtMouseVo:MouseCursorVo;
      
      private var crtMouseIcon:DisplayObject;
      
      private var crtSpecialCursorName:String;
      
      public function MouseIconManager()
      {
         super();
         specialCursorDic = new DictHash();
      }
      
      public static function get ins() : nslm2.mgrs.MouseIconManager
      {
         if(_ins == null)
         {
            _ins = new nslm2.mgrs.MouseIconManager();
         }
         return _ins;
      }
      
      public static function initCursorStyle() : void
      {
         var _loc3_:int = 0;
         registerCursor(App.asset.getBitmapData("png.a5.commonImgs.mouseCursors.img_awl"),"awl",new Point(12,15));
         registerCursor(App.asset.getBitmapData("png.a5.commonImgs.mouseCursors.img_hammer"),"hammer",new Point(18,13));
         registerCursor(App.asset.getBitmapData("png.a5.commonImgs.mouseCursors.img_flag"),"mouse_flag",new Point(16,16));
         var _loc1_:Vector.<BitmapData> = new Vector.<BitmapData>();
         var _loc2_:int = 3;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_.push(App.asset.getBitmapData("png.a5.commonImgs.mouseCursors.MouseFight" + (_loc3_ + 1)));
            _loc3_++;
         }
         registerCursors("mouseFight",_loc1_,10,new Point(16,7));
      }
      
      public static function registerCursors(param1:String, param2:Vector.<BitmapData>, param3:int, param4:Point) : void
      {
         var _loc5_:MouseCursorData = new MouseCursorData();
         _loc5_.data = param2;
         _loc5_.frameRate = param3;
         _loc5_.hotSpot = param4;
         Mouse.registerCursor(param1,_loc5_);
      }
      
      public static function registerCursor(param1:BitmapData, param2:String, param3:Point) : void
      {
         var _loc4_:MouseCursorData = new MouseCursorData();
         _loc4_.data = new Vector.<BitmapData>();
         _loc4_.data.push(param1);
         if(param2 == "mouse_flag")
         {
            _loc4_.hotSpot = param3;
         }
         Mouse.registerCursor(param2,_loc4_);
      }
      
      public static function reset() : void
      {
         if(RESET_EXCEPT_MOUSE.indexOf(Mouse.cursor) < 0)
         {
            Mouse.cursor = "auto";
         }
      }
      
      public static function changeMouseCursor(param1:String) : void
      {
         if(Mouse.cursor != param1)
         {
            Mouse.cursor = param1;
         }
      }
      
      public function initSpecialMouseCursor() : void
      {
         registSpecialMouseCursor("mouse_fight_big",2,"4040008",new Point(28,20));
      }
      
      public function registSpecialMouseCursor(param1:String, param2:int, param3:String, param4:Point = null) : void
      {
         var _loc5_:MouseCursorVo = new MouseCursorVo();
         _loc5_.assetType = param2;
         _loc5_.assetUrlOrEffectID = param3;
         _loc5_.hotPoint = param4;
         specialCursorDic.put(param1,_loc5_);
      }
      
      public function addMouseFor3D(param1:IMouseOutObject3D) : void
      {
         obj3d = param1;
         UIMgr.stage.addEventListener("mouseOver",layer2D_onRollOver);
      }
      
      private function layer2D_onRollOver(param1:MouseEvent) : void
      {
         UIMgr.stage.removeEventListener("mouseOver",layer2D_onRollOver);
         reset();
         hideSpecialMouseCursor();
         if(obj3d)
         {
            obj3d.doMouseOut();
            obj3d = null;
         }
      }
      
      public function showSpecialMouseCursor(param1:String) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         if(crtSpecialCursorName == param1)
         {
            return;
         }
         crtSpecialCursorName = param1;
         removeCrtBigMouseIcon();
         crtMouseVo = null;
         var _loc4_:MouseCursorVo = specialCursorDic.getValue(param1);
         if(_loc4_)
         {
            crtMouseVo = _loc4_;
            if(_loc4_.assetType == 1)
            {
               _loc3_ = App.asset.getBitmapData(_loc4_.assetUrlOrEffectID);
               if(_loc3_)
               {
                  crtMouseIcon = new Bitmap(_loc3_);
               }
            }
            else
            {
               _loc2_ = new BmcSpriteSheet();
               _loc2_.init(int(_loc4_.assetUrlOrEffectID),1,"all",true);
               crtMouseIcon = _loc2_;
            }
            if(crtMouseIcon)
            {
               crtMouseIcon.x = UIMgr.stage.mouseX;
               crtMouseIcon.y = UIMgr.stage.mouseY;
               if(crtMouseVo && crtMouseVo.hotPoint)
               {
                  crtMouseIcon.x = UIMgr.stage.mouseX - crtMouseVo.hotPoint.x;
                  crtMouseIcon.y = UIMgr.stage.mouseY - crtMouseVo.hotPoint.y;
               }
               UIMgr.stage.addChild(crtMouseIcon);
               UIMgr.stage.addEventListener("mouseMove",onMouseMove);
               Mouse.hide();
            }
         }
      }
      
      private function removeCrtBigMouseIcon() : void
      {
         if(crtMouseIcon)
         {
            if(crtMouseIcon is BmcSpriteSheet)
            {
               (crtMouseIcon as BmcSpriteSheet).dispose();
            }
            else if(crtMouseIcon.parent)
            {
               crtMouseIcon.parent.removeChild(crtMouseIcon);
            }
            crtMouseIcon = null;
         }
      }
      
      public function hideSpecialMouseCursor() : void
      {
         UIMgr.stage.removeEventListener("mouseMove",onMouseMove);
         removeCrtBigMouseIcon();
         crtSpecialCursorName = "";
         Mouse.show();
      }
      
      protected function onMouseMove(param1:MouseEvent) : void
      {
         if(crtMouseIcon)
         {
            crtMouseIcon.x = param1.stageX;
            crtMouseIcon.y = param1.stageY;
            if(crtMouseVo && crtMouseVo.hotPoint)
            {
               crtMouseIcon.x = param1.stageX - crtMouseVo.hotPoint.x;
               crtMouseIcon.y = param1.stageY - crtMouseVo.hotPoint.y;
            }
         }
      }
   }
}
