package game.ui.tooltipModules.comps
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class TooltipIconAndName_heroPieceUI extends View
   {
      
      protected static var uiView:XML = <View width="300" height="62">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_3" x="12" y="0" var="img_quality" width="58" height="58" sizeGrid="8,8,8,8"/>
			  <Image skin="png.a5.comps.img_block" x="15" y="3" width="52" height="52" var="img_icon"/>
			  <Label text="名称" autoSize="none" x="82" y="0" bold="false" size="14" var="txt_name" align="left" width="182" height="25" style="随品质变化"/>
			  <Label text="使用等级" autoSize="none" x="82" y="28" bold="false" size="12" var="txt2" align="left" width="182" height="25" style="不足禁止红"/>
			  <Label text="类型" autoSize="none" x="241" y="43" bold="false" var="txt_kind" size="12" width="62" align="right" isHtml="true" style="随品质变化"/>
			  <Image skin="png.a5.comps.img_block" x="236" y="24" width="52" height="52" var="img_group" anchorX="0.5" anchorY="0.5" autoSize="true"/>
			  <Label autoSize="none" x="256" y="11" bold="false" size="12" width="85" align="left" isHtml="true" style="普通说明" height="20" var="txt_group"/>
			</View>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_name:Label = null;
      
      public var txt2:Label = null;
      
      public var txt_kind:Label = null;
      
      public var img_group:Image = null;
      
      public var txt_group:Label = null;
      
      public function TooltipIconAndName_heroPieceUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         createView(uiView);
      }
   }
}
