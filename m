Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795632286;
	b=bAXiwxdRhOYH1aMWinPQ8AtJFFBC6Aeqfk73nlgVYVsO6864fKK5Hzaf+9n09dRSq90b
	 r8fwVlyjJyX0octen3tHH47yeJoXCXkEXCe2uLughhbZD8FVJZolHj8MjIW9Wxy2t6Aks
	 HnI8RcheYJR2sDVGbk82FfL9Yc6teyBcl3vNtYJYG9sN1q8vekX3l2lMmA9uhrx/8UwK5
	 3K0+s69K/C7iAv395CZ/VsGLz9kFfxnF36N6wlC3NJW0lipoNizNzAdssbyx22oAv4HXz
	 /ty388xFmfAITWGl+AwcplOn1uP+yT8WyQUcscYOxAO0YzvF6X9Riw+EJLGjjiMi3Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795632286;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7PCMIdRhoUBO1aBwtb3ejftG2W7OVTfFNwUhSkd3nUw=;
	b=y8QUzYtjYQB8S9vZ/mcfMLCpiWiqibVr2at2aWMKrohoSsRrB6qGQcz+6rXZ3dazwlIN
	 dHJfTb/0IZ8KutQ5bqWuO8tfadLH/4zM/VCWRcFzSVgX/IGmb3VT6ORfsYbQhm1XUoDl6
	 WXmKliZViAbTyuuAYif1WoF6qoCdo/vWw0X4cSXp5Uw/AbDJr/NzwxFy2frvHUgUR5hUE
	 2O5JhNeqptNWZkqPPk0Nb08BPOFk+u1UKIog6kzPh32kmk3rSp/7Lo9vsZlEOf/f7JWF+
	 lHLlINHVfqeAro27BJGEuBSf6oMaH7shomlFuEk9/0iXnBPmaotMC7Bbvg2Rl/VtJdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=h7i1QNLP;
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BF3606A31E
	for <io-uring@vger.kernel.org>; Wed, 25 Nov 2026 18:44:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3BF3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=h7i1QNLP
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-717080a2d50so5678245eaf.0
        for <io-uring@vger.kernel.org>; Wed, 25 Nov 2026 10:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel.dk; s=google; t=1795632285; x=1796237085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7PCMIdRhoUBO1aBwtb3ejftG2W7OVTfFNwUhSkd3nUw=;
        b=h7i1QNLPnOxHhZjibpDUtg4dTYuZT/mvGVEmEjn4fNsh1q+IhPFW+7dji4KbyRsJ56
         7zOGBKKJ4Gh1VGO+5oIZMEJwcbDTENCeEYAkteIuW4t4LMiD16xthWRzEW8lexRABunE
         AKJbe5EWL5vc7Pz95euBU2+ja/qSva1+Q+2xceVYxIi2wganK93+D1rbFakS5/XnxCnr
         G989sCR/jh53jQen3WWsSmm2nxhbZBk/zoIKY6GdTUfZOZcX4UOsBJWyZZz0s7YXrEFl
         GTGW4DjVUptbJ87iHkzg6vC+ZIPpDAgRHo8KO+ldoqqXTxjgCanSFe/UcCI/lBmHWkEq
         WOig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795632285; x=1796237085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7PCMIdRhoUBO1aBwtb3ejftG2W7OVTfFNwUhSkd3nUw=;
        b=EDlFKJEnGi8HeWwE1Girrb4vRi2xA7ulXz8CBgPe0l6Utlvki8bPBoKkH9h434+fNu
         1BLhq1iinTXIhjiek6RWcM9WpiEGallrJOwLDXVCyZa2eE0NUEf2FGr4ZoE3UJUbYuDe
         2mvWVgQO7nCnkKdM8pfP+E46LIIMlic6V+BbUEzGkFeeolL4dxoK1NUzpQtQ10Wt0TkU
         /w0QQk386KayJ0+D6VWZM6Un6Yya8cKn3PwiW45shGkZ1lKvDMjlMOmmdVBhasmcd9HU
         zfA3bxc4pM9tFHZTUaOsvmuKunD3y/KauG2MsOXIsVRoL3lE94kmO/Zbmj/LuBl3mwsz
         0Hgg==
X-Gm-Message-State: APuU4Z+H4zNxwuCU0rNoNNY/AjZLqNFS6tKTOZLygxG/1LYX3w0W7abR
	/sFluuaiTn+3abcYoXFky5nST4d0t2eQjFPluaJpCypy6WzowwdQSRTdH5PRdg7BhB7jWwBM4hP
	ANk0AdHg=
X-Gm-Gg: AZFdTZfdy3A9iUFmyRk+FURA/IixByvvcJv90+WSZMkZhii9JIpNwxyp1VXZpEJxtAG
	GzngxLdcYuKumzVj2rru8Ezos9oMMk3mu9ru6+hUiObTmvjpdRvFoClK6PVazXqGOSaDjM9mG4c
	igbnjozyTTuc2GvHJdF0LMl103dmSX3ZrXix4sSwvT/wxi2qGuTiHIypCqZnxWW/1EgBnbJDejd
	fYMsW1zW7zVmTq92KjdDCDgV7OWhBFaE/bIloisJVGBBTT5YisXXeQJP4x7Wgv+8w7w9Jj/TrGf
	K81hMjNcD38S0ABMHNkOl08LPCI/mTmPECxFG9t8RYqIBUyncKAyeK7mMYFKOOfes54RizuOrdY
	lkt77uykokqSrGZuZrO3M4EhqA5eMckYv51YMhD1kLES4pNHwhxJyKEfgxJ3L7SNv9JZ9tVribs
	iHBMRm3qtPRB1Ij4a2fVQ4EjxMyZUvoP5CGTnMCz6hAfrX1Zm0GDOQiNBtwqfHvtyIOqVCGIhgM
	Ovb+MmeEBdoVGenqAPtqnbt0jMB1Xmv856KOEJ7BMocJ/GU21lsdKewgimC7KcCi/KydLVccBnL
	tEbq0FiQCzi6SG+0sHIkr+68WBRmCVc/JnVouzcJBN+GTZYhEsbdlJbgRGB9q6Dl6gdWxJtA4BT
	+ziqHZ1l65fPadh8S3rjU3yvQ0Kwltda79w==
X-Received: by 2002:a05:6820:839c:b0:6f8:fcce:a410 with SMTP id 006d021491bc7-71b395100fdmr12277632eaf.55.1795632284984;
        Wed, 25 Nov 2026 10:44:44 -0800 (PST)
Received: from m5pro ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b37c52ae6sm12332828eaf.0.2026.11.25.10.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:44:44 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org
Cc: Chris Mason <mason@kernel.org>,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 02/10] io_uring/kbuf: clear REQ_F_BL_NO_RECYCLE on buffer put
Date: Wed, 25 Nov 2026 11:43:11 -0700
Message-ID: <20261125184439.58077-3-axboe@kernel.dk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261125184439.58077-1-axboe@kernel.dk>
References: <20261125184439.58077-1-axboe@kernel.dk>
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Mason <mason@kernel.org>

A bundle receive with MSG_WAITALL can hit a NULL pointer dereference in
io_net_kbuf_can_retry(), or share ring provided buffers with another
request of the buffer group, if another reader of the socket takes the
data that the receive is about to append.

The buffer list is only known within the issue that selected from it, so
io_recv() has to commit or recycle ring provided buffers before it
returns IOU_RETRY. On -EAGAIN it calls io_kbuf_recycle(), which does
nothing if REQ_F_BL_NO_RECYCLE is set. A partial transfer sets that flag
for the buffer that holds the data, and nothing ever clears it. That was
fine while only a multishot receive selected more than once, as
multishot excludes MSG_WAITALL. But since commit 7c71a0af81ba
("io_uring/net: improve recv bundles") any bundle receive can put its
buffers and select new ones, and the stale flag covers these too:

    io_recv()                    partial transfer
      io_net_kbuf_recyle()       sets the flag, commits the buffer
      return IOU_RETRY
    io_recv()                    fills the buffer, msg_inq > 1
      io_recv_finish()
        io_put_kbufs()           leaves the flag set
      io_buffers_peek()          sets REQ_F_BUFFERS_COMMIT
      sock_recvmsg()             -EAGAIN, the data is gone
      io_kbuf_recycle()          does nothing
      return IOU_RETRY           buffers mapped, but not committed
    io_recv()                    sel.buf_list is NULL, no selection
      sock_recvmsg()             partial transfer
      io_net_kbuf_can_retry()    reads bl->flags

The fix used here is to clear the flag when the request puts the buffers
that the flag was set for.

Fixes: 7c71a0af81ba ("io_uring/net: improve recv bundles")
Signed-off-by: Chris Mason <mason@kernel.org>
Signed-off-by: Jens Axboe <axboe@kernel.dk>
---
 io_uring/kbuf.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/io_uring/kbuf.c b/io_uring/kbuf.c
index 873d66a06b36..78d29008919a 100644
--- a/io_uring/kbuf.c
+++ b/io_uring/kbuf.c
@@ -428,6 +428,9 @@ unsigned int __io_put_kbufs(struct io_kiocb *req, struct io_buffer_list *bl,
 
 	ret = IORING_CQE_F_BUFFER | (req->buf_index << IORING_CQE_BUFFER_SHIFT);
 
+	/* only covers the buffer(s) being put, not a later selection */
+	req->flags &= ~REQ_F_BL_NO_RECYCLE;
+
 	if (unlikely(!(req->flags & REQ_F_BUFFER_RING))) {
 		io_kbuf_drop_legacy(req);
 		return ret;
-- 
2.55.0

