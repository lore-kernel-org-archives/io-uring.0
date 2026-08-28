Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B973A7F4D
	for <io-uring@vger.kernel.org>; Fri, 28 Aug 2026 03:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787888041; cv=pass; b=sHrUKElIYDLlOp+s3Czs+uOh5fiCtiatqWdfITw5My7OL3rPPgoFWHZFFrKssFlAKf512SvJkGZ/6QMwzLFcWYwvRjE16IQuW5VSNGgiQgBLoLdAIU8CNSvq/EhB5tdKoK4CFcA5FFWKA5SnaMNBCNojnOHjnXHsdnoNsgD4kzA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787888041; c=relaxed/simple;
	bh=eVCUgnuZPY9rp4G0hxfWBoh/8wdCFKKRU8Eq9Q7yXbg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PBGf3o9+i0YMtxIBw9Axi073+IgZpGtKBYGgIChwL+TYETV9J59S3F4eVs5L3L4HfkYnM0MnMM2nRg1hEJuh++lBPbd7AwsuYuKqueAVqVciK0ihPjEKxmwRM9AzjMysO9j42Xul7q8izUOpVAk7lcaPO7Up9VUNB59//uJF5Qw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qoJ0brIm; arc=pass smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qoJ0brIm"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7e9fc3de7ceso192998a34.1
        for <io-uring@vger.kernel.org>; Thu, 27 Aug 2026 20:33:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787888039; cv=none;
        d=google.com; s=arc-20260327;
        b=UQ7QYKT7bz2kwXuJ6ks+yJJoKPUs741RaMTY9BZE30sw7QJr/un5pl9VBbBuVrE4zi
         5Q9wRmqg76ZlifS7kmqeNnU4Fu6tz4bYfzHw1zOd5o2WQxYcZfWbO8gT6N3ZCH63deSq
         WYqHQKP4/bsHw7PvuU4psImVcBcdsir0wUq8xpDPI99XlQ5Wf78NkFERYX+XWlI86GhG
         z8IGZAbtGga3YdJ1cjv4lf9ywhLW5O+4kEbjJbQ8i0NVvGNAk/R9aohedAZw49sgxvR4
         DFndNo616t9g1wR/u8gkC3/Ot72Iv9FWi1aHCVE8exBBuQpaEiDYcEfghUFgbJSytkir
         f8yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tJ6GRA/2LwQW6/jDEIjrj/TZS2ZKHOJ3XYsZbyYACDw=;
        fh=gHU3nPhJuZXSBOfTcTzRVrlgl7PQyOIXA8dySBorcnE=;
        b=ZfI0X1Ufgxyc9SBuaNkvR6pwmodtadl75mC2RJcwwRcu6lO0ENMNsyJIwRepphPGYS
         pcdTWDs29ZZdOTJDixmWdcEOvRjD+qrwzRxxLRPZ5E4BATYMLzXryC4ZwnAY79aWRnBR
         HsY9+ebDqM4RXm5+38o8KYkpi2KRNMBEGO4KiVTIfWkzwwpzMnNGamcP7gtjEMqYX3dw
         tggvp/WwhYoi9uXiGm7pF/E1w48RWZ4L9kBCoujKwnT/5aNEom3jIaiMuk7FhNTPmtLq
         5pFjUbjARBb9rw9ymauEUwpxmCrIMM0gOaAIm0LvZca1diCuE5WD4YzLq5RZm12UYi8C
         K+Ew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787888039; x=1788492839; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tJ6GRA/2LwQW6/jDEIjrj/TZS2ZKHOJ3XYsZbyYACDw=;
        b=qoJ0brImXYW2jxuJ/+X9STf16jjXZ92rLmZ4786e6MVSpMWvhHnkJ14DzuZd++/cjq
         iXnv5vvRllyON65+nnXaCJ/b6+YH56o0zedDj/zHvJNlAGDchuDSruVJyLQBrV8WAXWs
         SravIim8345TcwwvXjYeU75tQ4kL7jLhRajFS1OSDokJJV/2VK2hrLyNHeytc09YbPBE
         jM2IhEqSV04jlyvKp+lPOuB2WYY9aatRDk+LOTBeBnMlDt3YlDDVrTb0oSdatP/JD6YQ
         IL0Ud2rj4HI2GkkPVHkPeM+vv4EnsEOhUTSW45cOfdJ43h4sIYmtFzLdciJnJMx53rpl
         0bRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787888039; x=1788492839;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tJ6GRA/2LwQW6/jDEIjrj/TZS2ZKHOJ3XYsZbyYACDw=;
        b=P4UhxYdUbaivGhdDZcKuJeVox3TJMch2mKvW1QepKJVQWBsF9f10Oq3RG1Jglg/x8r
         OA5ujT0zTd3v+Svc31hJRlAyb2QrLZMhsRzM4cHdBhx40D7hP5LzRp3egU3q9iSK0JxT
         CKVoJApD6BtpX3QA632MVndNvGn1LPYIKxXzUCLuFzYxJLIxQCtVmJyV8jffzIXEIBs3
         +oRUE69CHLiQ4NdoArdR+zSdrKSvLsuMtAYafm2RXAMuyqycpfpkAnQVLDhss2PQCSVi
         Gm4wRkAxT74qvo3Nl8ir3l3SLRXXtdy0I/D/fgCQKDMUsb/Ko6ZHpNS+1a13Avr71sdf
         XeIw==
X-Forwarded-Encrypted: i=1; AHgh+Rp/HAUD2rJ0xn90Ob8ePs9x42/XDu9X1Z2QmXDamDaLMkXSIbXDwOIrRvNkovcjGkP/vNv07cJd/g==@vger.kernel.org
X-Gm-Message-State: AFuF++lIn0mfYyKTl+1V9wR3ISLonS3H5sF8XdnwSlJf13rOQQruxNEK
	LAtIIPmgAeEAUzgnm2RpU1MzpYf1y2Ci28bHCFZCKGUynV2sHcS5il1I28Gwnr/rybxF78Hp2UJ
	cB2RGewpsG9fuuFDPfTFkb6wqZdtn/SQ=
X-Gm-Gg: AR+sD11d6D5pfB750tvYGZgaud52N6D1O0KJdwrna4CFBt6IoLhHFamVenFubEGZe4Z
	xxXBHemQ6PubCxmeUZ3gMFtZ/38y+F3ZWKZXw96Ac32RV2Dev0Z7VQ1QE08Dsu73IfAcb1quf4v
	aCEVrwaZ4BotGJ1F/WqbPeibLRTpfe1wK8ljKfFq8N6BQ0QE9RcwjRSW+FmYTzQECR5F/9oRFWF
	AVKf/BGUogzhlYuYW9L0bcz0qlW3fXyI9hfGcUSnhsgYaG/i0ioFL1bEaNYt6EdeqRqqkudHLlW
	Z8K1+5v+rFJwlD7vzrl9Kc03AQ1x5ygPVmingoGuCjraIAbLcbvbuKG8pQyCz3sBDJMH0sjbBO4
	BUa4MufCHtTDPxa24Y/eU3EEGzHNYeBePe6Zh9o9vFrYn
X-Received: by 2002:a05:6820:340e:10b0:6b1:67e1:fc8e with SMTP id
 006d021491bc7-6b1c66e6ce5mr2559540eaf.25.1787888038951; Thu, 27 Aug 2026
 20:33:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827185722.3234622-1-csander@purestorage.com>
 <20260827185722.3234622-2-csander@purestorage.com> <CAJnrk1YfTg-Lz+TmM+c=Asc8N4QGuY9_g8zUXtaNr4O7hG1Djw@mail.gmail.com>
 <CADUfDZoEosgMMQ47BDWBskTOZrYZpg6VUT5c4kwczDLRLXYk=Q@mail.gmail.com>
In-Reply-To: <CADUfDZoEosgMMQ47BDWBskTOZrYZpg6VUT5c4kwczDLRLXYk=Q@mail.gmail.com>
From: Ming Lei <tom.leiming@gmail.com>
Date: Thu, 27 Aug 2026 22:33:46 -0500
X-Gm-Features: AcwNN1V96G10EnqkMmlBEbQoJ8ihVOlJhML3SIuW3TsrH3jrmu0CBU7aGovmtII
Message-ID: <CACVXFVOLBVVGwfo+mbn+4jnGKZS66dL_2ghsKiaT6buscWJg6w@mail.gmail.com>
Subject: Re: [PATCH 1/2] io_uring/cmd: split io_uring_cmd_set_res() from io_uring_cmd_done()
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Joanne Koong <joannelkoong@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
	Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>, 
	Bernd Schubert <bernd@bsbernd.com>, Miklos Szeredi <miklos@szeredi.hu>, linux-block@vger.kernel.org, 
	linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org, 
	linux-btrfs@vger.kernel.org, fuse-devel@lists.linux.dev, 
	io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 4:44=E2=80=AFPM Caleb Sander Mateos
<csander@purestorage.com> wrote:
>
> On Thu, Aug 27, 2026 at 1:05=E2=80=AFPM Joanne Koong <joannelkoong@gmail.=
com> wrote:
> >
> > Hi Caleb,
> >
> > On Thu, Aug 27, 2026 at 11:57=E2=80=AFAM Caleb Sander Mateos
> > <csander@purestorage.com> wrote:
> > >
> > > In preparation for setting the io_uring NVMe passthru CQE results fro=
m
> > > the blk-mq request completion rather than the task work callback, spl=
it
> > > out functions io_uring_cmd_set_res{,32}() from io_uring_cmd_done{,32}=
().
> > > This allows io_uring_cmd_done{,32}() and __io_uring_cmd_done() to be
> > > consolidated into a single CQE-size-agnostic function with 3 fewer
> > > arguments than __io_uring_cmd_done().
> > >
> >
> > The conversion looks logically correct to me but the interface feels a
> > bit annoying / fragile on the caller side.
> >
> > Is there a way nvme can get what it needs without changing the other
> > callers? Would it work to just keep the existing
> > io_uring_cmd_done{,32}() as is and add a separate API for special
> > callers like nvme, eg:
> >
> >   void io_uring_cmd_set_res32(struct io_uring_cmd *cmd, s32 ret, u64 re=
s2);
> >   void __io_uring_cmd_done(struct io_uring_cmd *cmd, unsigned issue_fla=
gs);
> >
> > where io_uring_cmd_done{,32} would then just be inline wrappers over
> > those? afaict, then only the nvme callsite would have to change and
> > fuse, btrfs, block, ublk, and scsi_bsg could just stay as is. Do you
> > think something like that makes sense to do?

Yeah, this way is definitely much better from a driver viewpoint.



Thanks,
Ming Lei
