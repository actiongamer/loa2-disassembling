package game.ui.shenYuans
{
   import morn.customs.components.PlayerRender;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import morn.core.components.Image;
   
   public class ShenYuanHelpRenderUI extends PlayerRender
   {
      
      protected static var uiView:XML = <PlayerRender width="326" height="85">
			  <Image skin="png.uiShenYuan.help.img_bg" x="0" y="0"/>
			  <Label text="label" autoSize="left" x="90" y="9" width="206" height="22" var="txt_name"/>
			  <Label text="label" autoSize="left" x="90" y="37" width="60" height="18" var="txt_lv" style="普通说明"/>
			  <Label text="label" autoSize="left" x="90" y="57" width="122" height="18" var="txt_fightValue" style="普通说明"/>
			  <Button label="选择" x="209" style="按钮中绿" y="42" var="btn_ok"/>
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_2" x="17" y="12" var="img_quality" sizeGrid="6,6,6,6" width="58" height="58"/>
			  <Image skin="png.comp.image" x="20" y="15" width="52" height="52" var="img_icon"/>
			</PlayerRender>;
       
      
      public var txt_name:Label = null;
      
      public var txt_lv:Label = null;
      
      public var txt_fightValue:Label = null;
      
      public var btn_ok:Button = null;
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public function ShenYuanHelpRenderUI()
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
