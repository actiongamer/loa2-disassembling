package morn.customs.components
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import com.mz.core.utils.DisplayUtils;
   import flash.geom.Point;
   import flash.events.MouseEvent;
   import com.mz.core.mgrs.UIMgr;
   import flash.events.Event;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import com.mz.core.configs.EnvConfig;
   import com.mz.core.utils.MathUtil;
   import nslm2.mgrs.skins.SkinLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import flash.display.DisplayObject;
   import flash.geom.Rectangle;
   import flash.display.BitmapData;
   
   public class PanelBg extends View implements IPanelBg
   {
      
      protected static var uiXML:XML = <View width="276" height="195" sceneColor="0xffffff" layers="3,1,1,1,btnClose;6,1,1,0,gRect;5,1,1,1,titleName;7,1,1,0,tilteNameBg;2,1,1,1,img_rim;4,1,1,1,bgCustom;1,1,1,0,img_rimBg" compId="10">
			  <Image skin="png.a5.bgs.panelBgs.raw.底板一级二级底九宫格" layer="1" left="3" right="3" top="29" bottom="4" var="img_rimBg" sizeGrid="44,32,44,32" x="4" y="29" width="269" height="161" compId="1"/>
			  <Image skin="png.a5.bgs.panelBgs.raw.面板分割线" x="7" y="64" layer="1" var="img_tabLine" left="4" right="4" compId="2"/>
			  <Image layer="4" var="bgCustom" compId="3"/>
			  <Image skin="png.a5.bgs.panelBgs.raw.底板一级框" layer="2" sizeGrid="72,136,72,53" left="-13" right="-15" top="-8" bottom="-2" var="img_rim" x="-13" y="-8" width="304" height="205" compId="4"/>
			  <Image skin="png.a5.bgs.panelBgs.raw.一级底板标题头底" x="6" layer="7" width="264" height="23" var="img_titleBg" centerX="0" y="2" compId="5"/>
			  <Image layer="5" var="img_titleName" y="3" anchorY="0.5" autoSize="true" centerX="0" x="97.5" compId="6"/>
			  <Label text="标题" autoSize="none" styleSkin="png.comp.label" layer="6" style="渐变2" mouseEnabled="false" align="center" var="txt_titleName" left="0" right="0" y="3" x="0" compId="7" height="18" width="276"/>
			  <GRect fillAlpha="0.5" radius="0,0,0,0" lineAlpha="0" styleSkin="png.compCustoms.grect" layer="6" var="gDrag" left="0" right="0" height="30" x="-2" y="-1" compId="8"/>
			  <Button skin="png.a5.btns.btn_closeS1" y="3" layer="3" stateNum="1" right="6" var="btn_close" x="240" compId="9"/>
			</View>

		;
      
      public static const BTN_CLOSE_STYPE_NORMAL:int = 1;
       
      
      public var img_rimBg:Image = null;
      
      public var bgCustom:Image = null;
      
      public var img_tabLine:Image = null;
      
      public var img_rim:Image = null;
      
      public var img_titleName:Image = null;
      
      public var gDrag:morn.customs.components.GRect = null;
      
      public var txt_titleName:Label = null;
      
      public var btn_close:Button = null;
      
      public var img_titleBg:Image = null;
      
      public var dragFixedEnabled:Boolean = true;
      
      protected var _panelView:morn.customs.components.PanelViewBase;
      
      protected var startMousePoi:Point;
      
      protected var startPanelPoi:Point;
      
      private var _panelDragEnabled:Boolean = true;
      
      private var _btnCloseStyle:int;
      
      private var _titleImgId:int;
      
      public function PanelBg()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         createView(uiXML);
      }
      
      override protected function initialize() : void
      {
         super.initialize();
         this.showTabLine = false;
         this.btnCloseStyle = 1;
         this.panelDragEnabled = true;
         if(this.txt_titleName)
         {
            this.txt_titleName.text = "";
         }
         if(img_titleName)
         {
            this.img_titleName.skin = null;
         }
         if(this.gDrag)
         {
            this.gDrag.fillAlpha = 0;
            gDrag.addEventListener("mouseDown",drag_onMouseDown);
         }
         if(this.btn_close)
         {
            this.btn_close.addEventListener("click",btnCloseHandler);
         }
      }
      
      public function get panelView() : morn.customs.components.PanelViewBase
      {
         if(_panelView == null)
         {
            _panelView = DisplayUtils.findParentMatchingClass(this,morn.customs.components.PanelViewBase) as morn.customs.components.PanelViewBase;
         }
         return _panelView;
      }
      
      protected function drag_onMouseDown(param1:MouseEvent) : void
      {
         this.startMousePoi = new Point(UIMgr.stage.mouseX,UIMgr.stage.mouseY);
         this.startPanelPoi = new Point(this.panelView.x,this.panelView.y);
         UIMgr.stage.addEventListener("mouseMove",drag_onMouseMove);
         UIMgr.stage.addEventListener("mouseUp",drag_onMouseUp);
         this.dispatchEvent(new Event("dragStart"));
      }
      
      protected function drag_onMouseMove(param1:MouseEvent) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:* = null;
         if(this.isDisposed)
         {
            UIMgr.stage.removeEventListener("mouseMove",drag_onMouseMove);
            UIMgr.stage.removeEventListener("mouseUp",drag_onMouseUp);
            return;
         }
         if(param1.buttonDown)
         {
            _loc5_ = new Point(UIMgr.stage.mouseX,UIMgr.stage.mouseY);
            _loc6_ = new Point(_loc5_.x - startMousePoi.x,_loc5_.y - startMousePoi.y);
            _loc3_ = startPanelPoi.x + _loc6_.x;
            _loc4_ = startPanelPoi.y + _loc6_.y;
            _loc2_ = ModuleMgr.ins.toGlobalPoi(this.panelView.parent);
            if(!(EnvConfig.ins.showDebugModule || dragFixedEnabled == false))
            {
               _loc3_ = MathUtil.maxMin(_loc3_,UIMgr.gameWidth - this.panelView.width - _loc2_.x,-_loc2_.x);
               _loc4_ = MathUtil.maxMin(_loc4_,UIMgr.gameHeight - this.panelView.height - _loc2_.y,-_loc2_.y);
            }
            this.panelView.x = _loc3_;
            this.panelView.y = _loc4_;
            this.dispatchEvent(new Event("dragUpdate"));
         }
         else
         {
            this.drag_onMouseUp();
         }
      }
      
      protected function drag_onMouseUp(param1:MouseEvent = null) : void
      {
         UIMgr.stage.removeEventListener("mouseMove",drag_onMouseMove);
         UIMgr.stage.removeEventListener("mouseUp",drag_onMouseUp);
         this.dispatchEvent(new Event("dragEnd"));
      }
      
      protected function btnCloseHandler(param1:MouseEvent) : void
      {
         if(this.panelView)
         {
            this.panelView.btnCloseHandler(param1);
         }
      }
      
      public function get panelDragEnabled() : Boolean
      {
         return _panelDragEnabled;
      }
      
      public function set panelDragEnabled(param1:Boolean) : void
      {
         _panelDragEnabled = param1;
         if(this.gDrag)
         {
            this.gDrag.visible = param1;
         }
      }
      
      public function get btnCloseStyle() : int
      {
         return _btnCloseStyle;
      }
      
      public function set btnCloseStyle(param1:int) : void
      {
         _btnCloseStyle = param1;
         if(this.btn_close)
         {
            if(param1 == 0)
            {
               this.btn_close.visible = false;
            }
            else
            {
               this.btn_close.visible = true;
               this.btn_close.skin = SkinLib.changeSkinNum_S(this.btn_close.skin,param1);
            }
         }
      }
      
      public function get showTabLine() : Boolean
      {
         if(this.img_tabLine == null)
         {
            return false;
         }
         return this.img_tabLine.visible;
      }
      
      public function set showTabLine(param1:Boolean) : void
      {
         if(this.img_tabLine)
         {
            this.img_tabLine.visible = param1;
         }
      }
      
      override protected function changeSize() : void
      {
         super.changeSize();
      }
      
      public function get titleImgId() : int
      {
         return _titleImgId;
      }
      
      public function set titleImgId(param1:int) : void
      {
         _titleImgId = param1;
         this.txt_titleName.text = LocaleMgr.ins.getStr(9100000 + param1);
      }
      
      public function bgHoleByComp(param1:DisplayObject, param2:int) : void
      {
         this.img_rimBg.commitMeasure();
         var _loc3_:Point = DisplayUtils.localToTarget(param1,this.img_rimBg);
         this.bgHole(new Rectangle(_loc3_.x,_loc3_.y,param1.width,param1.height),param2);
      }
      
      private function bgHole(param1:Rectangle, param2:int) : void
      {
         var _loc3_:* = null;
         img_rim.mouseEvent = false;
         this.img_rimBg.commitMeasure();
         this.img_rimBg.bitmap.commitMeasure();
         var _loc4_:BitmapData = this.img_rimBg.bitmapData;
         if(_loc4_.transparent == false)
         {
            _loc3_ = new BitmapData(_loc4_.width,_loc4_.height,true,0);
            _loc3_.draw(_loc4_);
         }
         else
         {
            _loc3_ = _loc4_.clone();
         }
         _loc3_.fillRect(param1,0);
         this.img_rimBg.bitmapData = _loc3_;
      }
   }
}
