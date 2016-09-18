package game.ui.resourceDg
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class ResBossRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="78" height="114">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_2" x="9" y="27" var="img_quality" sizeGrid="6,6,6,6" width="62" height="62"/>
			  <Image skin="png.comp.image" x="12" y="30" var="img_icon" width="57" height="56"/>
			  <Image skin="png.uiMainCitys.resDg.img_boss_bg" x="11" y="71" var="img_bb"/>
			  <Label text="角色名字六字" autoSize="none" x="-11" y="96" style="普通绿色" width="100" height="18" align="center" var="txt_name"/>
			  <Label text="加底标题" autoSize="none" x="-11" y="2" style="加底标题" width="100" align="center" var="txt_title" height="20"/>
			  <Label text="普通说明" x="12" y="71" style="普通说明" align="center" var="txt_tip" width="55" height="18" autoSize="none"/>
			  <Image skin="png.uiMainCitys.resDg.img_select" x="1" y="19" name="selectBox1"/>
			</View>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var img_bb:Image = null;
      
      public var txt_name:Label = null;
      
      public var txt_title:Label = null;
      
      public var txt_tip:Label = null;
      
      public function ResBossRenderUI()
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
