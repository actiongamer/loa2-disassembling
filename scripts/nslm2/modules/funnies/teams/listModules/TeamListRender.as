package nslm2.modules.funnies.teams.listModules
{
   import game.ui.teams.listModules.TeamListRenderUI;
   import com.mz.core.mediators.RollMediator;
   import flash.events.MouseEvent;
   import com.mz.core.event.MzEvent;
   import proto.TeamBasicInfo;
   import nslm2.utils.Uint64Util;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.funnies.teamGuajiScenes.TeamGuajiService;
   import morn.customs.expands.MornExpandUtil;
   import com.mz.core.mediators.RollHighLightMediator;
   
   public class TeamListRender extends TeamListRenderUI
   {
      
      public static const EVT_CLICK:String = "EVT_CLICK";
       
      
      private var rollMed:RollMediator;
      
      private var _info:TeamBasicInfo;
      
      public function TeamListRender()
      {
         super();
         rollMed = new RollHighLightMediator(this,this.img_bg);
         this.parts.push(new RollHighLightMediator(this,this.img_bg));
      }
      
      private function onBtnApllyClick(param1:MouseEvent) : void
      {
         this.btn_apply.visible = false;
         if(this.info)
         {
            this.dispatchEvent(new MzEvent("EVT_CLICK",this.info,true));
         }
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(param1 is TeamBasicInfo || param1 == null)
         {
            this.info = param1 as TeamBasicInfo;
         }
      }
      
      public function get info() : TeamBasicInfo
      {
         return _info;
      }
      
      public function set info(param1:TeamBasicInfo) : void
      {
         _info = param1;
         if(_info)
         {
            this.switchActived(true);
            if(!_info.setting.autoagreeall || Uint64Util.compareValue(_info.setting.autoagreeability,Uint64Util.fromNumber(PlayerModel.ins.totalFightValue)) > 0 || _info.setting.autoagreelevel > PlayerModel.ins.level)
            {
               this.mouseEnabled = false;
               this.btn_apply.visible = true;
               this.btn_apply.addEventListener("click",onBtnApllyClick);
            }
            else
            {
               this.addEventListener("click",onClick);
            }
            this.txt_name.text = info.name;
            this.txt_no.text = LocaleConsts.no(Uint64Util.toNumber(info.id));
            this.img_icon.url = HeroInfoUtil.getHeadIconUrl(_info.id,_info.npcId);
            if(Uint64Util.equal(_info.setting.autoagreeability,Uint64Util.fromNumber(0)))
            {
               this.txt_fvMin.visible = false;
            }
            else
            {
               this.txt_fvMin.text = LocaleMgr.ins.getStr(41210053,[info.setting.autoagreeability.toString()]);
            }
            if(_info.setting.autoagreelevel > 0)
            {
               this.txt_fvMin.visible = true;
               this.txt_fvMin.text = LocaleMgr.ins.getStr(41210057,[info.setting.autoagreelevel.toString()]);
            }
            this.txt_memberCount.text = info.count + "/" + TeamGuajiService.ins.teamMaxMemberNum;
         }
         else
         {
            this.switchActived(false);
         }
      }
      
      private function switchActived(param1:Boolean) : void
      {
         MornExpandUtil.switchChildrenVisible(this,param1,"RENDER_NULL_HIDE",[this.img_bg]);
         this.buttonMode = param1;
         this.rollMed.actived = param1;
         this.img_bg.filters = [];
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         if(this.info)
         {
            this.dispatchEvent(new MzEvent("EVT_CLICK",this.info,true));
         }
      }
   }
}
