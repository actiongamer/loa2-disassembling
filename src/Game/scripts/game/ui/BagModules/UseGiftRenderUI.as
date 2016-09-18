package game.ui.BagModules
{
   import morn.customs.components.PlayerRender;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import morn.core.components.Image;
   
   public class UseGiftRenderUI extends PlayerRender
   {
      
      protected static var uiView:XML = <PlayerRender width="410" height="48">
			  <Label text="名字" x="45" y="13" var="txt_name" width="129" height="18" align="center" style="随品质变化"/>
			  <Label text="LV.56" x="175" y="13" var="txt_lv" width="43" height="18" style="普通说明"/>
			  <Label text="战力:xxx" x="235" y="13" var="txt_fightValue" width="96" height="18" style="普通说明"/>
			  <Button label="赠送" buttonMode="true" labelFont="FZZHB" x="334" y="9" var="btn_do" style="按钮小绿"/>
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_2" x="0" y="0" var="img_quality" sizeGrid="6,6,6,6" width="42" height="42"/>
			  <Image skin="png.comp.image" x="4" y="4" var="img_icon" width="34" height="34"/>
			  <Image skin="png.a5.commonImgs.小框分割线" y="45" width="402" x="2" var="img_line"/>
			</PlayerRender>;
       
      
      public var txt_name:Label = null;
      
      public var txt_lv:Label = null;
      
      public var txt_fightValue:Label = null;
      
      public var btn_do:Button = null;
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var img_line:Image = null;
      
      public function UseGiftRenderUI()
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
