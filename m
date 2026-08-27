Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83437370D79
	for <io-uring@vger.kernel.org>; Thu, 27 Aug 2026 21:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787867072; cv=pass; b=Rl4KKnb80+Y7Y3gL+rqabWvPaLtG43uHrI+DysFPo5g2Qj8nBt5k4cDwRhZHbRZ5uKRjJuGuIH/VH+JmEsdWvG6WaWKNXx7AEFwXZ10vsEpzW0iDRhSkNEUQ5+2y4CcXVt7WHLB5nxyhS3HCsMRXC8vjmkWAFBL7m1otL7N4gI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787867072; c=relaxed/simple;
	bh=0sBuqucNWMJ3PQ7mkm0GStLfwt7hAbIgMaO5tBFyaUk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E23NQOYbajELZfTsc0EzNWutOHGqDiRfOPoO8W/6XuJw0lRL8/Jm/k1ID2eQA+ksKgixrWCYBj8TSlO72yN9wvhgBKGlWLfaKddtaxS5M1+v5dLEKdI+giIsv+klgGaHkqS1eKu25/NUH/wLo6n5yGCLxBc8LzMcp6HG9WsGcT4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=ZTrSBDI+; arc=pass smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="ZTrSBDI+"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-4639900c172so42119fac.3
        for <io-uring@vger.kernel.org>; Thu, 27 Aug 2026 14:44:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787867069; cv=none;
        d=google.com; s=arc-20260327;
        b=nm4rnqAfQNpZboXta9XgZFu1nkLHlI4y+iiBC1QhhoXmBW2NrGjNBCcs1WKr3J0ySa
         0hLddZrJChc9cm86T2XfjSOz/MMa6aR1f5PqTz4pCy0Ocoz+5PsRPaXSlI57x760jhev
         h5tE9541eUJLJRtvXWEgiyRlK/RHZ5ehD4K1wiGIaNPbBH5hzg/LvDOum3PetBBk4+Qs
         8+YG+roMOXzn2IdDfoxTFy2nuCOEdAsaDsc8VXnD7LuhRGa7gkTiA9rL3E6WEg8Ime9j
         N+5D7oJhFumlrdri/PuUsBqxJor+xud/sXGtW7kcbjqb4zM4Gz/4/WvDICkFOlRRo1LS
         VuFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kqBamkmhnxpQu01OYVCgjjVqjgGXsL5/W693jooZv34=;
        fh=/ymDJVpYIxLU4dO/zvIjNIrmOa+pAfyYk6eSg5mhaD8=;
        b=Bn9aSUsKanpiujuYi8+EiMswrb4y3wAcffdgn53QSra0PGuHhfaKTH0ycvGhkvmveI
         b6qTOYxq1hThDQN32Ue20UeFSEpUz9ssW4Yitr8EIS8l/OgZukvP+FZeFdyW+V6FCnzp
         hexrEd+f29ZqYp1yZIRV2TKMcgIHxB9nW/nYXyBZq5haPhXPR54BsMdsJPBbI5qs9Xto
         DfNxOdoJpeKDOo3EnvU5bZaSGcnm//5igTW0A3sfoel9m2afwzy2qQ8BdSywYQ85BJ1v
         yrtNwahKyv51W8qsfoFZ6mLpt+UFIg+ds+dlfT7o8VjtaUS0nGRjHb9RYndHvdzSRPgC
         mKuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1787867069; x=1788471869; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kqBamkmhnxpQu01OYVCgjjVqjgGXsL5/W693jooZv34=;
        b=ZTrSBDI+mPv6N+9HPOoOcSbhmUkUBhPzXdGsbf4IcAnGI0Glqh1gi6UK5sJn1/UOuI
         5WmYrDNdNGftOFB6sL0MsoG/GkrMAQOqk/tokMVid4ixJn1zODd/o8mkwRCF+4s5Mx7n
         hzC5Rcnw9GFjAl5mx4JAznYgPZlfoPtUtQefmpUgYVySl+64X0J9WDaZpDg1K40kLxFw
         dRzkW1d/qKFjpgUkbllKjyQtj5tGs943l6r+mg6H+DoHnElbM1F3AcDi9+ZLC8pX+3hg
         PbdqhPbq9qlvZ9qS4MO7t8+5PpUTFYv7xwC7k48XRi0qLhUD2tMajDDlzIUqlsjJ9Bdx
         NVJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787867069; x=1788471869;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kqBamkmhnxpQu01OYVCgjjVqjgGXsL5/W693jooZv34=;
        b=dwRecHjU1/0j2TGQvGRNvOhZrkECDVRVoegp6sE3/1KfNZhvNETLP8meT5WZCwSs4n
         FdWToLubCVY49j3FEPBwsTVx6nfeVnUxY5CF9YAyhwNFuSL5JdMPh3R+Fw98pdCGIpw7
         5yRRhjuCJUD48p1GnVRds/ovat71nHsGtog5IhiZAIjUc18QGVlsUurenzGqYJa6ifJy
         mEzsJ7ZRBaauuvCycA421/N7ihKkxjjPovc0S79l3nPOuEHjjJPYbEAv8/j56xUEdBNA
         PInurFWgUJXsfsXUQLLQ/OZVKnI2gLPs/nTVy/rJKFjDfJyhG4p9jZPmndFyjQKw7bgu
         3aeQ==
X-Forwarded-Encrypted: i=1; AHgh+RpIMgHTwVYv3alDZR+3XWb9bjr3Em0SI71nrDRh4n0OfeiV2wQTAw0US3Lg4eY5tcRf0l0y7FlBww==@vger.kernel.org
X-Gm-Message-State: AFuF++nxusZghH8T+p5GwtRBb/dQbYI6fHo0N3TC5Rg5GoPxTGYixQpl
	oCCv0zCEPFzm4YI5R4Knr76aRIC3mHBTctSb96gKyC/9F1y6el867iqhyfbxAjPdygD+kKv3+E9
	7rjGqFSbqiNF2ifOrCqyZu7fFZKBvOSvbwiGpTRxHiQ==
X-Gm-Gg: AR+sD13YMCn8NFcdTVFoZNLZ8qX7+4K2HPFeD/BHB2gopRiNpx25yQz/uBGeCLx8HzJ
	+YAYz48AmVVrJxQm3WANm2KasnJWlMyfcmq2Egzb1sl+E4KhXgvdy9BcXfsk/+S7yoVbciXlPdT
	7+1tGVoi+VYUD1eijiObWXzUUXn6nrVe46lW2UQW2Odt73N53bznP2KSh2LA2St0laCdJH49LFC
	FjWXhtz7XszFvlT+ZJF7CEDV0hGEr5R7OJnRSGFA/I9aQa1yefZdhDvlI4HQD4IRN7zQivi0LgN
	w3FIglxVDnq3PxL+Lw3YY7xkecRWE2pbcZn01ELwnrv1AQ==
X-Received: by 2002:a05:6870:45a0:b0:42e:7e04:e9ce with SMTP id
 586e51a60fabf-468328882d8mr1702119fac.0.1787867069273; Thu, 27 Aug 2026
 14:44:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827185722.3234622-1-csander@purestorage.com>
 <20260827185722.3234622-2-csander@purestorage.com> <CAJnrk1YfTg-Lz+TmM+c=Asc8N4QGuY9_g8zUXtaNr4O7hG1Djw@mail.gmail.com>
In-Reply-To: <CAJnrk1YfTg-Lz+TmM+c=Asc8N4QGuY9_g8zUXtaNr4O7hG1Djw@mail.gmail.com>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Thu, 27 Aug 2026 14:44:18 -0700
X-Gm-Features: AcwNN1UylVUquZ8opNqZqu3tNIHriO6d1S55vB3s5Iygu5DbEGaADAEUlDBXhJo
Message-ID: <CADUfDZoEosgMMQ47BDWBskTOZrYZpg6VUT5c4kwczDLRLXYk=Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] io_uring/cmd: split io_uring_cmd_set_res() from io_uring_cmd_done()
To: Joanne Koong <joannelkoong@gmail.com>
Cc: Jens Axboe <axboe@kernel.dk>, Ming Lei <tom.leiming@gmail.com>, 
	Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>, 
	Bernd Schubert <bernd@bsbernd.com>, Miklos Szeredi <miklos@szeredi.hu>, linux-block@vger.kernel.org, 
	linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org, 
	linux-btrfs@vger.kernel.org, fuse-devel@lists.linux.dev, 
	io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 1:05=E2=80=AFPM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
> Hi Caleb,
>
> On Thu, Aug 27, 2026 at 11:57=E2=80=AFAM Caleb Sander Mateos
> <csander@purestorage.com> wrote:
> >
> > In preparation for setting the io_uring NVMe passthru CQE results from
> > the blk-mq request completion rather than the task work callback, split
> > out functions io_uring_cmd_set_res{,32}() from io_uring_cmd_done{,32}()=
.
> > This allows io_uring_cmd_done{,32}() and __io_uring_cmd_done() to be
> > consolidated into a single CQE-size-agnostic function with 3 fewer
> > arguments than __io_uring_cmd_done().
> >
>
> The conversion looks logically correct to me but the interface feels a
> bit annoying / fragile on the caller side.
>
> Is there a way nvme can get what it needs without changing the other
> callers? Would it work to just keep the existing
> io_uring_cmd_done{,32}() as is and add a separate API for special
> callers like nvme, eg:
>
>   void io_uring_cmd_set_res32(struct io_uring_cmd *cmd, s32 ret, u64 res2=
);
>   void __io_uring_cmd_done(struct io_uring_cmd *cmd, unsigned issue_flags=
);
>
> where io_uring_cmd_done{,32} would then just be inline wrappers over
> those? afaict, then only the nvme callsite would have to change and
> fuse, btrfs, block, ublk, and scsi_bsg could just stay as is. Do you
> think something like that makes sense to do?

Sure, sounds fine to me. Thanks for taking a look.

Best,
Caleb
