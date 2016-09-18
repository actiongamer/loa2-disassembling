package game.ui.heroChooseModules
{
   import morn.customs.components.WealthRender;
   import morn.core.components.CheckBox;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class HeroChooseRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="97" height="198">
			  <Image skin="png.a5.commonImgs.img_fengBao" x="0" y="0" width="96" height="198"/>
			  <CheckBox x="40" y="154" selected="false" style="CheckBox普通" var="checkBox_choose"/>
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_2" x="24" y="24" var="img_quality" sizeGrid="6,6,6,6" width="50" height="50"/>
			  <Image skin="png.comp.image" x="27" y="27" var="img_icon" width="44" height="44"/>
			  <Label text="月神祭司" y="79" style="普通说明" height="18" var="txt_name" align="center" centerX="0"/>
			  <Image skin="png.uiHeroChoose.img_renderBg" x="1.5" y="109"/>
			  <Image skin="png.a5.commonImgs.img_chooseFrame" x="-15" y="-16" mouseEnabled="false" mouseChildren="false" var="img_frame"/>
			  <Image skin="png.a5.commonImgs.img_chooseFrame" x="-15" y="-16" mouseEnabled="false" mouseChildren="false" name="selectBox0"/>
			</WealthRender>;
       
      
      public var checkBox_choose:CheckBox = null;
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_name:Label = null;
      
      public var img_frame:Image = null;
      
      public function HeroChooseRenderUI()
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
