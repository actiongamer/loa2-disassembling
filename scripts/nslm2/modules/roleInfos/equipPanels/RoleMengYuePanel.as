package nslm2.modules.roleInfos.equipPanels
{
   import game.ui.roleInfos.equipPanels.RoleMengYuePanelUI;
   import nslm2.modules.footstones.tooltipsModules.uis.ITooltipUI;
   import flash.text.TextFormat;
   import flash.events.MouseEvent;
   import flash.events.Event;
   import com.mz.core.utils.DisplayUtils;
   import morn.core.components.Label;
   import nslm2.modules.footstones.tooltipsModules.ToolTipYuanFenVo;
   
   public class RoleMengYuePanel extends RoleMengYuePanelUI implements ITooltipUI
   {
       
      
      private var fm:TextFormat;
      
      private var margin:int = 12;
      
      public function RoleMengYuePanel()
      {
         super();
         fadeViewId = 30100;
      }
      
      override public function btnCloseHandler(param1:MouseEvent = null) : void
      {
         super.btnCloseHandler(param1);
         this.dispatchEvent(new Event("close"));
      }
      
      public function updateMengYueData(param1:Array) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc4_:* = null;
         var _loc5_:Boolean = false;
         var _loc8_:int = 0;
         var _loc7_:* = null;
         DisplayUtils.disposeChildren(outVBox);
         var _loc6_:int = param1.length;
         _loc8_ = 0;
         while(_loc8_ < _loc6_)
         {
            _loc7_ = param1[_loc8_];
            _loc4_ = "<font color = \'#eac472\'>[" + _loc7_.name + "] </font>";
            _loc5_ = _loc7_.isActivate;
            _loc3_ = new Label();
            if(_loc5_)
            {
               _loc2_ = "<font color = \'#23c423\'>" + _loc7_.getHtmlDes() + "</font>";
            }
            else
            {
               _loc2_ = "<font color = \'#aaaaaa\'>" + _loc7_.des + "</font>";
            }
            _loc3_.isHtml = true;
            _loc3_.autoSize = "left";
            _loc3_.text = _loc4_ + " " + _loc2_;
            if(_loc3_.width >= 300)
            {
               _loc3_.multiline = true;
               _loc3_.wordWrap = true;
               _loc3_.width = 300;
            }
            outVBox.addChild(_loc3_);
            _loc8_++;
         }
         img_bg2.height = outVBox.height + 75;
         img_bg2.width = outVBox.width + 40;
         img_line.width = outVBox.width - 10;
      }
      
      public function show(param1:*, param2:* = null) : void
      {
         updateMengYueData((param1 as ToolTipYuanFenVo).mengYueArr);
      }
      
      public function get showHeight() : int
      {
         return this.width;
      }
      
      public function get showWidth() : int
      {
         return this.height;
      }
   }
}
