package nslm2.modules.funnies.worldBoss.view.render
{
   import game.ui.worldBoss.WorldBossHeaderUI;
   import proto.WorldBossInfo;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import flash.events.MouseEvent;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcGroupVo;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.common.vo.PlayerVo;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.modules.battles.battle.HPTween;
   import nslm2.utils.TimeUtils;
   import nslm2.common.compsEffects.MaskProgressBar;
   
   public class WorldBossHead extends WorldBossHeaderUI
   {
       
      
      private var _data:WorldBossInfo;
      
      private var reiviveCd:TextCDCtrlS2;
      
      public function WorldBossHead()
      {
         super();
         var _loc1_:MaskProgressBar = new MaskProgressBar(this.progress_hp);
         this.parts.push(_loc1_);
         this.progress_hp.alignRight = true;
         this.img_point.y = this.progress_hp.height / 2;
         this.progress_hp.addChild(this.img_point);
         nameUseLink = false;
         img_icon.buttonMode = true;
         img_icon.addEventListener("click",gotoKillBoss);
      }
      
      protected function gotoKillBoss(param1:MouseEvent) : void
      {
         if(_data)
         {
            ObserverMgr.ins.sendNotice("family_boss_goto_kill_bosss",_data.bossid);
         }
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc2_:* = null;
         var _loc3_:Number = NaN;
         _data = param1 as WorldBossInfo;
         list_buff.dataSource = [];
         txt_reviveCD.text = "";
         if(_data)
         {
            _loc4_ = StcMgr.ins.getNpcGroupVo(_data.npcgroupid);
            _loc5_ = StcMgr.ins.getNpcVo(_loc4_.display_npc);
            _loc2_ = new PlayerVo();
            _loc2_.baseId = _loc5_.id;
            _loc2_.headerIconUrl = HeroInfoUtil.getHeadIconUrl(null,_loc5_.id);
            _loc2_.level = _loc5_.level;
            _loc2_.name = TextFieldUtil.htmlText2(LocaleMgr.ins.getStr(_loc5_.name),ColorLib.qualityColor(_loc5_.quality));
            playerVo = _loc2_;
            this.txt_hp.text = _data.hp + "/" + _data.maxhp;
            _loc3_ = this.progress_hp.value;
            this.progress_hp.value = _data.hp / _data.maxhp;
            if(_loc3_ != 1 && _data.hp != 0)
            {
               new HPTween(progress_hp.bar,16711680,false);
            }
            this.progress_hp.commitMeasure();
            this.img_point.x = this.progress_hp.bar.x + 1;
            this.img_point.visible = progress_hp.value >= 0.98?false:true;
            list_buff.dataSource = _data.buffids;
            img_die.visible = false;
            img_icon.disabled = false;
            if(_data.relivetimestamp)
            {
               if(!reiviveCd)
               {
                  reiviveCd = new TextCDCtrlS2(txt_reviveCD,cdFortmat,null);
                  this.parts.push(reiviveCd);
               }
               reiviveCd.start(_data.relivetimestamp);
            }
            else
            {
               if(_data.hp == 0)
               {
                  img_die.visible = true;
                  img_icon.disabled = true;
               }
               else
               {
                  img_die.visible = false;
                  img_icon.disabled = false;
               }
               if(reiviveCd)
               {
                  reiviveCd.dispose();
                  reiviveCd = null;
               }
               txt_reviveCD.text = "";
            }
         }
         .super.dataSource = param1;
      }
      
      private function cdFortmat(param1:int) : String
      {
         return LocaleMgr.ins.getStr(40740100) + ":" + TimeUtils.isColonWithZero(param1);
      }
      
      override public function dispose() : void
      {
         if(reiviveCd)
         {
            reiviveCd.dispose();
            reiviveCd = null;
         }
         super.dispose();
      }
   }
}
