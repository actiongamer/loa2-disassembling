package game.ui.fashionAcc
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class FashionAccSelectTitleRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="194" height="58">
			  <Button skin="png.uiFashion.btn_label" x="0" y="0" width="194" height="58"/>
			  <Image skin="png.uiFashionUpgrade.打造选择界面.图标底02" x="3" y="1" var="img_icon" scale="0.8" smoothing="true"/>
			  <Image skin="png.uiFashionUpgrade.打造选择界面.图标底02" var="img_iconSelected" name="selectBox1" smoothing="true" scale="0.8" x="3" y="1"/>
			  <Label text="精彩活动" autoSize="none" x="-12.5" y="19" style="普通说明" width="79" height="18" align="center" var="txt_name" mouseChildren="false" mouseEnabled="false"/>
			  <Label text="精彩活动可以获得" autoSize="none" x="54" y="19" style="渐变1" width="144" height="25" align="center" var="txt_name2" mouseChildren="false" mouseEnabled="false"/>
			  <Image skin="png.a5.bgs.listRenderBgs.renderBgS3Selected" x="-2" y="-2" width="198" height="62" mouseChildren="false" mouseEnabled="false" name="selectBoxAll"/>
			</View>;
       
      
      public var img_icon:Image = null;
      
      public var img_iconSelected:Image = null;
      
      public var txt_name:Label = null;
      
      public var txt_name2:Label = null;
      
      public function FashionAccSelectTitleRenderUI()
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
