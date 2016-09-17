package game.ui.guildPKCrossSer
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.ProgressBar;
   import morn.core.components.Label;
   import morn.core.components.Button;
   
   public class GPKSkillRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="207" height="423">
			  <Image skin="png.comp.image" x="0" y="0" width="207" height="423" var="img_bg"/>
			  <Image skin="png.comp.image" x="42" y="59" var="img_icon"/>
			  <ProgressBar skin="png.uiGuildPKCrossSer.progress_skill" x="48" y="147" var="progress"/>
			  <Label text="渐变1" autoSize="none" x="4" y="3" style="渐变1" width="197" height="22" align="center" var="txt_title" size="14"/>
			  <Label text="普通说明" autoSize="none" x="19" y="211" style="普通说明" width="162" height="100" var="txt_desc"/>
			  <Label text="普通说明" autoSize="none" x="4" y="333" style="普通说明" width="188" height="20" var="txt_price"/>
			  <Button label="按钮" x="60" y="363" style="按钮中绿" var="btn_buy"/>
			</View>;
       
      
      public var img_bg:Image = null;
      
      public var img_icon:Image = null;
      
      public var progress:ProgressBar = null;
      
      public var txt_title:Label = null;
      
      public var txt_desc:Label = null;
      
      public var txt_price:Label = null;
      
      public var btn_buy:Button = null;
      
      public function GPKSkillRenderUI()
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
