package game.ui.fashionAcc
{
   import morn.customs.components.SkillRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class FashionAccSkillRenderUI extends SkillRender
   {
      
      protected static var uiView:XML = <SkillRender width="335" height="110">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_1" y="35" sizeGrid="6,6,6,6" width="56" height="56" var="img_quality" x="0"/>
			  <Image skin="png.comp.image" x="3" y="38" width="50" height="50" var="img_icon"/>
			  <Image skin="png.a5.commonImgs.img_yellow" x="87" y="0"/>
			  <Label text="普通技" autoSize="none" x="36" y="5" width="254" align="center" var="txt_kind" bold="false" wordWrap="true" style="加底标题"/>
			  <Label text="技能描述" autoSize="none" width="265" height="70" align="left" var="txt_desc" bold="false" wordWrap="true" style="普通说明" x="64" y="35"/>
			  <Label text="无技能" autoSize="none" width="321" height="53" align="center" var="txt_no_skill" bold="false" wordWrap="true" style="普通说明" x="3" y="52" multiline="true"/>
			</SkillRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_kind:Label = null;
      
      public var txt_desc:Label = null;
      
      public var txt_no_skill:Label = null;
      
      public function FashionAccSkillRenderUI()
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
