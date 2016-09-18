package nslm2.modules.footstones.resGetPoints
{
   import game.ui.resGetPoints.ResGetPointResRenderUI;
   import nslm2.mgrs.skins.SkinLib;
   import nslm2.utils.LabelUtils;
   import nslm2.utils.WealthUtil;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class ResGetPointResRender extends ResGetPointResRenderUI
   {
       
      
      private var resVo:nslm2.modules.footstones.resGetPoints.ResGetPointModuleParam;
      
      public function ResGetPointResRender()
      {
         super();
         this.btn_enter.clickHandler = btn_handler;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(param1 is nslm2.modules.footstones.resGetPoints.ResGetPointModuleParam)
         {
            resVo = param1 as nslm2.modules.footstones.resGetPoints.ResGetPointModuleParam;
            if(resVo.iconUrl)
            {
               this.img_icon.visible = true;
               this.img_icon.skin = resVo.iconUrl;
               this.img_quality.visible = true;
               this.img_quality.skin = SkinLib.changeSkinNum(this.img_quality.skin,resVo.quality);
               this.txt_name.visible = true;
               this.txt_name.text = resVo.name;
               this.txt_countAndNeed.visible = true;
               this.txt_countAndNeed.text = resVo.count + "/" + resVo.need;
               this.txt_countAndNeed.color = LabelUtils.getCountNeedColor(resVo.count,resVo.need);
            }
            else if(resVo.wealthKind)
            {
               this.wealthVo = WealthUtil.needVo(resVo.wealthKind,resVo.sid,resVo.needNum);
            }
         }
      }
      
      private function btn_handler() : void
      {
         ObserverMgr.ins.sendNotice("MSG_RES_GET_POINT_ENTER",resVo);
      }
   }
}
