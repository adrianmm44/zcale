package zcale.view.css.tests;

import sys.io.File;
import zcale.view.css.C;
import zcale.view.css.Style;

class CssTest {
	
	public static function main( path : String ) {		
				
		var css = C.doc()
			.addImport("/css/stylesheet.css")
			.add([
			
			C.id("first-test")
				
				.align.content.center()
				.align.items.stretch()
				.align.self.auto()
				.background.set("#FFF")
				.background.attachment.fixed()
				.background.clip.borderBox()
				.background.color.set("#FFF")
				.background.image.url("dir1/dir2/img.jpg")
				.background.origin.borderBox()
				.background.position.center()
				.background.repeat.xy()
				.background.size.auto()
				.border.set("#000")
				.border.bottom.set("#999")
				.border.bottom.width.set( 1 )
				.border.bottom.color.set("#777")
				.border.bottom.style.solid()
				.border.bottom.leftRadius.set( 10 )
				.border.bottom.rightRadius.set( 10 )
				.border.collapse.no()
				.border.color.set("#555")
				.border.image.url("img/my-image.jpg","30 round")
				.border.image.outset.set( 10 )
				.border.image.repeat.round()
				.border.image.slice.set( 10 )
				.border.image.source.url("img/my-image.jpg")
				.border.image.width.set( 1 )
				.border.left.set("#111")
				.border.radius.set( 10 )
				.border.right.set("000")
				.border.spacing.set( 20 )
				.border.style.solid()
				.border.top.set("#FFF")
				.border.width.set( 1 )
				.bottom.set( 10 )
				.box.shadow.set( 10, 10, 10, "#000", true )
				.box.sizing.borderBox()
				.captionSide.bottom()
				.clear.both()
				.clip.rect( 0, 100, 200, 0 )
				.color.set("#CCC")
				.column.count.set( 3 )
				.column.gap.set( 30 )
				.column.rule.set("#999")
				.column.rule.color.set("#777")
				.column.rule.style.solid()
				.column.rule.width.set( 1 )
				.column.span.all()
				.column.width.set( 100 )
				.column.set( 100, 3 )
				.content.set("my content")
				.counter.increment.set("my-id")
				.counter.reset.none()
				.cursor.pointer()
				.direction.leftToRight()
				.display.inlined()
				.emptyCells.hide()
				.flex.all( 2, 2 )
				.flex.basis.set( 80 )
				.flex.direction.column()
				.flex.flow.set("row","nowrap")
				.flex.grow.set( 0 )
				.flex.shrink.set( 1 )
				.flex.wrap.yes()
				.float.right()
				.font.all( 12, 30, "bold")
				.font.family.Arial()
				.font.size.set( 11 )
				.font.style.italic()
				.font.variant.smallCaps()
				.font.weight.bold()
				.height.set( 300 )
				.height.min.set( 200 )
				.height.max.set( 500 )
				.justifyContent.spaceAround()
				.left.set( 10 )
				.letterSpacing.set( 2 )
				.lineHeight.ratio( 2 )
				.listStyle.url("img/my-image.jpg", "inside")
				.listStyle.image.url("img/my-image.jpg")
				.listStyle.position.inside()
				.listStyle.type.circle()
				.margin.set( 10 )
				.margin.bottom.set( 10 )
				.opacity.set( 0.5 )
				.order.set( 2 )
				.outline.set("#FFF")
				.outline.color.set("#000")
				.outline.style.solid()
				.outline.width.thick()
				.overflow.auto()
				.overflow.x.visible()
				.overflow.y.hidden()
				.padding.set( 10 )
				.padding.bottom.set( 10 )
				.pageBreak.after.always()
				.pageBreak.before.always()
				.pageBreak.inside.avoid()
				.perspective.set( 400 )
				.perspective.origin.xy("50%","50%")
				.position.absolute()
				.quotes.set("<<", ">>", "<", ">")
				.right.set( 10 )
				.tableLayout.fixed()
				.text.align.center()
				.text.decoration.underline()
				.text.indent.set( 50 )
				.text.overflow.ellipsis()
				.text.shadow.set( 1, 1, 2, "#000")
				.text.transform.lowercase()
				.top.set( 10 )
				.transform.set("rotate(7deg)")
				.unicodeBidi.embed()
				.verticalAlign.middle()
				.visibility.hidden()
				.whiteSpace.normal()
				.width.set( 900 )
				.width.min.set( 600 )
				.width.max.set( 1200 )
				.word.spacing.set( 30 )
				.word.breaking.normal()
				.word.wrap.breakWord()
				.zIndex.set( -1 )
				/*/
				.color.set("#F00")
				.opacity.set( 0.5 )
				.width.set( 300 )
				.height.set( 200 )
				.minWidth.set( 200 )
				.minHeight.set( 100 )
				.maxWidth.set( 400 )
				.maxHeight.set( 300 )
				.left.set( 25 )
				.top.set( 25 )
				.right.set( 25 )
				.bottom.set( 25 )
				.add.child( 
					C.tag("p")
					.color.set("#CCC")
					.add.child( 
						C.tag("span")
						.color.set("999")
						.add.mediaQuery( 
							C.media.sm()
							.color.set("#333")
							.add.child(
								C.tag("b")
								.color.set("000")
								.add.mediaQuery(
									C.media.md()
									.color.set("#FFF")
								)
							)
						)
					)				
				)			
				.add.sibling( 
					C.tag("div")
				 	.color.set("#EEE")
				)			
				/*/
				,
			C.id("second-test")
				.background.url("dir1/dir2/img.jpg", "no-repeat")
				.box.shadow.set( 10, 10 )
				.column.set( 100 )
				.flex.set( 2 )
				.lineHeight.set( 30 )
				.listStyle.set("disc","inside")
				.quotes.set("<<", ">>")
				.text.shadow.set( 2, 2 )
		]);									
		File.saveContent( path, css.toString() );
	}
}