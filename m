Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793716298;
	b=2Yi6sJMsgwJQNQMg0ethGMy3a4aX9BV7Wh8h/rgEqYh45NTazNjDtghTj9ncKtT/xJ+P
	 4kP50GK3pO68wAVrj3xiCvXvnsy5L5rJabnOuL7I2g3GQp8rCovJyxjxVA+oPDO4Usq+q
	 68DbAo/9uDNHpXW0HKCFfOqTg/ijfcoZoltKrqkPuwDfqBvVTDLebhn0zxCej1EYl5Vc2
	 uGUdEq16o6qqwzTZSQgCyE+7UZXEQEicuEJdOT/MC0tJCZr8NEERVWFYebdD9vH/Ef4bJ
	 +ED5a7eiCwbD35HNPqwagSW6sULyF779ePTsbMZEaYvfpRn4Z2CWOV/rF1es5cDm9Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716298;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=hPPW6gsIkZazXoljHsP3T+oDXyldHk382XBY2Kbrr+0=;
	b=MBV81zIu8/T/gtN7MhgtMfGjAOkI3JAko34us9saLYFsLTNzKD1iE7VX2bCNwYgRSl6E
	 1lPOzCWX9TwNlrjT6ZGyr+cPpSH0+ftfedboT1RwyDn4hFhNzkNGiJMhxCayVRYCw2uMt
	 Un7PR9PQ6TmxjfiPVGXDPULz9zBGIXrI+fneheJwO+CWKfIv5353Lq/ju1O1O+/BZ7ieo
	 Xc8yMKCse5YKZFeHaM/H1tUgT1px3u0szdDlub+dyqw4hXPs0Ofz9IysClIoauDcPLo7P
	 nQoxa1QPkVd93LMDNKJ9B+oFKeMTh4Rcyf66kayI21lMeiRUnskeZbVKBpV/HMsaBtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=acBOIPEd;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B52C60A261F
	for <io-uring@vger.kernel.org>; Tue,  3 Nov 2026 14:31:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B52C60A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=acBOIPEd
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1a8cc11ac42so4165768c88.0
        for <io-uring@vger.kernel.org>; Tue, 03 Nov 2026 06:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793716297; x=1794321097; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hPPW6gsIkZazXoljHsP3T+oDXyldHk382XBY2Kbrr+0=;
        b=acBOIPEd4MpcNLQs3XSsuc401B43jfRZum3MQDPezPNaUfXqPRk0RQyylj42AsGdVM
         8GcuBcD05N4B2D1lPOMoyUtzLlz6fO3SKLVVRocEh1PABFoPcC6NN7OGrbraGdyCyZBi
         RzL/QoeCdgltMReYAaDeMiFuVDv8K7M0dZIXkQY9ZokmrWutGzCZwSgFBXPdpc7KZWj9
         aKkyU9f4kjP2uWpMldAbjjO5ya7eOfTMdVmSoRYgU8QcoMRCOdoCAbN8Brfj+ucDg8PR
         Aab7BGngrr3izfTbxqAtaC242uOySxdtGlBD/HFzb+cJteHzf8BfzVfGCRyUIB42/F+R
         zstg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793716297; x=1794321097;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hPPW6gsIkZazXoljHsP3T+oDXyldHk382XBY2Kbrr+0=;
        b=h+dc9iFa78aaVRYoWt8eTE9r1td7x5j/XKy+VLUT+v2atiSByozUW6KsJGp35lYrRx
         /p519GLkruRb8lXejyJc29MV1NT9oaEXFQUgdjVs84tMR9nFO5jzRoiNbH11RW3w9sHB
         PXKYGQC6/cxoKLgdU+8M9sxhKWONoMa19N+zAuSdsuwyU0vpky+uJik863UmqE+lmD5S
         1gua3m9sGXGQPjM2EOxH8ND/ApNV8nRt1ycL8GWDcqyURDDbo5Lynz2f/TqVbEkqOKMt
         8wCS9VQtnXPFHr3oGgm6gbgCfj5i8rtplU+4Haz0+dzx7A46msUDQMf0askuSGqOytT9
         PF8Q==
X-Gm-Message-State: APuU4Z/vQ9DFzpRd8jm19c90q9ddMZ/qaDMALo/iU+yblWEu/yw1Bn3Z
	WmMvLToFpmQqBF3JC/07CWmGsTtVSqDRyJlfsh9koIUbeeQFJeSprkiiGGakbLKJmpQZ/sy4Fyr
	O05loznU=
X-Gm-Gg: AYBFou35PqdsXuEPz7Nw8d66Tr92DZWEoS+bivCw7B3/piHqQIKUtB0HRrynMk9zfB8
	42Q9meoV00fMRIbx5ty8tTN3vyvMBilDmjbIZGYC7UrzL2tGwSbuhae8qgxZ9OMieqlutFuKVPR
	o4F5Wk7xjQj90nm4G/FbAZ0TRo++2ktBwnTB8qNRIgY94yob5Qvto8hmozkNqKTAaUpvCDp5MYi
	2u3gY5I/fCpkcrF6H0wvBWwxXRzaKMPl3RvNyOBHgkx09Lf7C7WnmrUJGrdPNte1wrDysDgUdcX
	Y1s6b6WbZyuXmlDwxwKvg/IF7x5RZP8IqNAQL4UgKmrBvPOlC4NQwbuyrzeTPXGwsNuqtZNmrSD
	E8J9y2AhUNSZwd+GlPKlbQqQt44guXu44FPvI0qxBNaimCW9pnzdbYo6XMC+X9OssIuubu3cgkT
	EIKqgiMCmn9kg0gFppUlk02Wci+r4mNrtYdnd9rcG6Mp7CokIk9hvOQCHldWruiiGbFN4p2Xqk+
	qiHY6/lCAYApIqgYixmn6WT6YRCZPb60amjsMY522YsHxYJ1D2u9aSKW/yjrLO1fsPb7pVR5hYh
	+51HmhvC7YWSYhOVNFLlGLb/EStAD7qiljs+R/JGolsMpOTohANAxK4bg9D6JKR2TgReDSpAX8X
	6bTmLOef1J1jp
X-Received: by 2002:a05:7023:a42:b0:151:ece6:b16b with SMTP id a92af1059eb24-1ac5da755bdmr17688608c88.7.1793716297254;
        Tue, 03 Nov 2026 06:31:37 -0800 (PST)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b23b847348sm9534779c88.4.2026.11.03.06.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:31:36 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org, Shang En Sim <sim@shangen.org>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org
In-Reply-To: <20261030050319.1448530-1-sim@shangen.org>
References: <20261030050319.1448530-1-sim@shangen.org>
Subject: Re: [PATCH 0/2] io_uring/cancel: cancel all poll matches in one
 pass
Message-Id: <179371629644.3691261.15458912717105276248.b4-ty@b4>
Date: Tue, 03 Nov 2026 07:31:36 -0700
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Fri, 30 Oct 2026 00:03:15 -0500, Shang En Sim wrote:
> IORING_OP_ASYNC_CANCEL with IORING_ASYNC_CANCEL_ALL cancels poll
> requests one at a time, and every lookup starts over at the beginning
> of the poll hash. Cancelled requests stay hashed until their task work
> runs, so each lookup also walks past the ones already cancelled. One
> cancel that matches K of N pending polls costs about K*N/2 visits in a
> single io_uring_enter(), with uring_lock held.
> 
> [...]

Applied, thanks!

[1/2] io_uring/cancel: count all requests that a CANCEL_ALL cancels
      commit: 21ddbb14f7c3baab50a2a6c13ee375edc2bbe031
[2/2] io_uring/poll: cancel all matching requests in one pass
      commit: 9eff9c07e927dcd9c57150cd6fb3d4ec76f00480

Best regards,
-- 
Jens Axboe



