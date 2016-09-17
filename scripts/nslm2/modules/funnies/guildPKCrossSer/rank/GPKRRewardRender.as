package nslm2.modules.funnies.guildPKCrossSer.rank
{
   import game.ui.guildPKCrossSer.GPKRank.GPKRRwardRenderUI;
   import nslm2.mgrs.stcMgrs.vos.StcRankVo;
   import nslm2.utils.WealthUtil;
   
   public class GPKRRewardRender extends GPKRRwardRenderUI
   {
       
      
      public function GPKRRewardRender()
      {
         super();
      }
      
      private function get vo() : StcRankVo
      {
         return this.dataSource as StcRankVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(param1)
         {
            var _loc2_:* = vo.rank;
            if("1:1" !== _loc2_)
            {
               if("2:2" !== _loc2_)
               {
                  if("3:3" !== _loc2_)
                  {
                     this.txt_rank.visible = true;
                     this.img_rank.visible = false;
                     this.txt_rank.text = vo.rank.split(":").join("-");
                  }
                  addr64:
                  this.item0.dataSource = WealthUtil.costStrToArr(vo.jibenjiangli);
                  this.item1.dataSource = WealthUtil.costStrToArr(vo.chaojijiangli);
               }
               addr14:
               this.txt_rank.visible = false;
               this.img_rank.visible = true;
               this.img_rank.skin = "png.a5.commonImgs.rank.img_crown" + vo.rank.split(":")[0];
               §§goto(addr64);
            }
            §§goto(addr14);
         }
      }
   }
}
