package nslm2.modules.foundations.guildModule.view.panel.main
{
   import game.ui.guildModules.mainView.GuildActivityListRenderUI;
   import nslm2.modules.foundations.guildModule.vo.GuildActivityVo;
   import nslm2.common.ui.components.comps2d.others.TaskAlertRenderS3;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.foundations.miniNotice.MiniNoticeModel;
   import proto.FunctionActionInfo;
   import nslm2.utils.TimeUtils;
   import org.manager.DateUtils;
   import nslm2.utils.ServerTimer;
   import com.mz.core.mediators.RollHighLightMediator;
   
   public class GuildActivityListRender extends GuildActivityListRenderUI
   {
       
      
      private var _data:GuildActivityVo;
      
      private var LOCALE_PREFIX:int = 11000030;
      
      public function GuildActivityListRender()
      {
         super();
         this.parts.push(new RollHighLightMediator(this));
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc4_:* = null;
         img_redPoint.visible = false;
         txt_name.visible = true;
         _data = param1 as GuildActivityVo;
         if(_data)
         {
            if(_data.id == 6)
            {
               this.box_alert.visible = true;
               (this.box_alert as TaskAlertRenderS3).show(40714);
            }
            else
            {
               this.box_alert.visible = false;
            }
            this.img_got.visible = false;
            img_funBg.skin = UrlLib.guildActivityRenderBg(_data.id);
            this.txt_name.text = LocaleMgr.ins.getStr(int(LOCALE_PREFIX) + int(_data.id));
            if(_data.status)
            {
               img_lock.visible = false;
               box_content.disabled = false;
            }
            else
            {
               box_content.disabled = true;
               img_lock.visible = true;
            }
            if(_data.status == 2)
            {
               img_redPoint.visible = true;
            }
            txt_info.text = _data.rewardStr;
            txt_info.commitMeasure();
            if(_data.id == 1)
            {
               if(_data.status == 2)
               {
                  this.toolTip = LocaleMgr.ins.getStr(11000700);
               }
               else
               {
                  this.img_got.visible = true;
                  this.toolTip = LocaleMgr.ins.getStr(11000701);
                  txt_name.visible = false;
               }
            }
            if(_data.id == 3)
            {
               if(StcMgr.ins.getFunctionVo(40740).isopen == 2)
               {
                  img_lock.visible = true;
               }
               _loc3_ = MiniNoticeModel.ins.eventDict.getValue(40740);
               if(!_loc3_)
               {
                  txt_info.text = _data.rewardStr;
                  return;
               }
               _loc2_ = TimeUtils.pareseSecondToDate(_loc3_.starttime);
               _loc4_ = ServerTimer.ins.date;
               if(_loc2_.date == _loc4_.date && _loc4_.month == _loc2_.month)
               {
                  txt_info.text = LocaleMgr.ins.getStr(40740906,[TimeUtils.hiWithZero(_loc2_)]);
               }
               else
               {
                  txt_info.text = _data.rewardStr;
               }
               if(StcMgr.ins.getFunctionVo(40740).isopen != 1)
               {
                  txt_info.visible = false;
               }
               else
               {
                  txt_info.visible = true;
               }
            }
         }
      }
   }
}
