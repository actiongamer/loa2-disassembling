package game.ui.skillChangePanel
{
   import morn.customs.components.SkillRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.Button;
   
   public class SkillKindRenderUI extends SkillRender
   {
      
      protected static var uiView:XML = <SkillRender width="444" height="110" mouseChildren="true" mouseEnabled="true">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_1" x="15" y="43" sizeGrid="6,6,6,6" width="56" height="56" var="img_quality"/>
			  <Image skin="png.comp.image" x="18" y="46" width="50" height="50" var="img_icon"/>
			  <Image skin="png.a5.commonImgs.img_yellow" x="147" y="8"/>
			  <Label text="普通技" autoSize="none" x="96.5" y="13" width="254" align="center" var="txt_kind" bold="false" wordWrap="true" style="加底标题"/>
			  <Label text="技能描述技能描述技能描述技能描述技能描述技能描述技能描述技能描述技能描述技能描述技能描述" autoSize="none" width="265" height="70" align="left" var="txt_desc" bold="false" wordWrap="true" style="普通说明" x="79" y="43"/>
			  <Button label="\l40100002" x="349" y="47" style="按钮中绿" var="btn_change"/>
			  <Image skin="png.uiSkillChange.img_selectBox" x="-2" mouseEnabled="false" mouseChildren="false" name="selectBox0"/>
			</SkillRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_kind:Label = null;
      
      public var txt_desc:Label = null;
      
      public var btn_change:Button = null;
      
      public function SkillKindRenderUI()
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
