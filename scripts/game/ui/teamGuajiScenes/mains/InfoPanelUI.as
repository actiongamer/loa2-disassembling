package game.ui.teamGuajiScenes.mains
{
   import morn.customs.components.FadeView;
   import morn.core.components.Label;
   import morn.core.components.Box;
   import morn.core.components.Button;
   import morn.core.components.CheckBox;
   
   public class InfoPanelUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="267" height="172">
			  <Image skin="png.uiTeamGuajis.挂机底" x="-1" y="0" mouseEnabled="false" mouseChildren="false"/>
			  <Label text="扫荡中......" autoSize="none" x="93" y="3" style="渐变1" var="txt_state" width="477" height="35" align="left"/>
			  <Box x="92" y="31" var="info_box" width="126" height="95">
			    <Button label="开始挂机" y="92" style="按钮中绿" var="btn_do" x="-17"/>
			    <CheckBox label="自动组队" y="66" selected="false" style="CheckBox普通" var="cb_atuo" x="2"/>
			    <Label text="累计杀怪:" autoSize="none" style="普通说明" var="txt_kill" x="0" y="0"/>
			    <Label text="剩余精力:123" autoSize="none" y="22" style="普通说明" var="txt_left_energy" x="0"/>
			    <Button skin="png.a5.btns.btn_addGreen" x="87" y="20" stateNum="1" var="btn_buyStamina"/>
			    <Label text="剩余精力:123" autoSize="left" y="44" style="普通说明" var="txt_left_time" x="0"/>
			    <Button label="\l9041219" y="92" style="按钮中绿" var="btn_qiangduo" x="72"/>
			  </Box>
			  <Label text="屠魔印记收益加成：@param" autoSize="none" x="-154" y="-19" style="重要提示绿" width="286" height="20" var="label_buff" align="right"/>
			</FadeView>;
       
      
      public var txt_state:Label = null;
      
      public var info_box:Box = null;
      
      public var btn_do:Button = null;
      
      public var cb_atuo:CheckBox = null;
      
      public var txt_kill:Label = null;
      
      public var txt_left_energy:Label = null;
      
      public var btn_buyStamina:Button = null;
      
      public var txt_left_time:Label = null;
      
      public var btn_qiangduo:Button = null;
      
      public var label_buff:Label = null;
      
      public function InfoPanelUI()
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
