package nslm2.modules.foundations.vip.render
{
   import game.ui.vipModule.render.VipPrivilegeRenderUI;
   import nslm2.modules.foundations.vip.vo.VipTitleVo;
   
   public class VipPrivilegeRender extends VipPrivilegeRenderUI
   {
       
      
      public function VipPrivilegeRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:* = null;
         .super.dataSource = param1;
         if(param1 as String)
         {
            this.txt_prompt.text = param1 as String;
            txt_prompt.toolTip = "";
         }
         else if(param1 as VipTitleVo)
         {
            _loc2_ = (param1 as VipTitleVo).desc;
            if(_loc2_.length > 25)
            {
               _loc2_ = _loc2_.slice(0,20 + Math.random() * 3);
               _loc2_ = _loc2_ + " . . .";
            }
            this.txt_prompt.text = _loc2_;
            this.txt_prompt.width = 183;
            this.txt_prompt.x = this.txt_prompt.x + 5;
            this.txt_prompt.align = "left";
            this.txt_prompt.style = "加底标题";
            txt_prompt.toolTip = (param1 as VipTitleVo).desc;
         }
      }
   }
}
